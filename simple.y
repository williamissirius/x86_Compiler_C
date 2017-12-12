/*
 * CS250
 *
 * simple.l: simple parser for the simple "C" language
 *
 */

%token	<string_val> WORD

%token 	NOTOKEN LPARENT RPARENT LBRACE RBRACE LCURLY RCURLY COMA SEMICOLON EQUAL STRING_CONST LONG LONGSTAR VOID CHARSTAR CHARSTARSTAR INTEGER_CONST AMPERSAND OROR ANDAND EQUALEQUAL NOTEQUAL LESS GREAT LESSEQUAL GREATEQUAL PLUS MINUS TIMES DIVIDE PERCENT IF ELSE WHILE DO FOR CONTINUE BREAK RETURN

%union	{
		char   *string_val;
		int nargs;
		int my_nlabel;
	}

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int line_number;
const char * input_file;
char * asm_file;
FILE * fasm;

#define MAX_ARGS 5
int nargs;
char * args_table[MAX_ARGS];

#define MAX_GLOBALS 100
int nglobals = 0;
char * global_vars_table[MAX_GLOBALS];

int global_vars_type[MAX_GLOBALS];

#define MAX_LOCALS 16
int nlocals = 0;
int tempNLocal[1000] = {};
int countTempNLocal = 0;
char * local_vars_table[MAX_LOCALS];
int local_vars_type[MAX_LOCALS];


#define MAX_STRINGS 100
int nstrings = 0;
char * string_table[MAX_STRINGS];

char *regStk[]={ "rbx", "r10", "r13", "r14", "r15"};
char nregStk = sizeof(regStk)/sizeof(char*);
//char *regByteStk[]={""}

char *regArgs[]={ "rdi", "rsi", "rdx", "rcx", "r8", "r9"};
char nregArgs = sizeof(regArgs)/sizeof(char*);

int localCharStarFlag = 0;

int current_type;

int top = 0;

int nargs =0;
 
int nlabel = 0;

int jumpingLabel = 0;

int LoopTypeFlag = 0;	//1 for while; 2 for do while; 3 for for loop

int latestWhileN = -1;
int latestForN = -1;
int latestDoWhileN = -1;

void addGlobalVar(char *id, int type) {
  global_vars_table[nglobals]=id;
  global_vars_type[nglobals]=type;
  nglobals++;
}

int lookupGlobalVar(char *id) {
	 int i;
	 for (i=0; i<nglobals;i++) {
		 if (!strcmp(global_vars_table[i], id)) {
			 return i;
		 }
	 }
	 return -1;
}

void addLocalVar(char *id, int type) {
  local_vars_table[nlocals]=id;
  local_vars_type[nlocals]=type;
  nlocals++;
}

int lookupLocalVar(char *id) {
	 int i;
	 for (i=0; i<nlocals;i++) {
		 if (!strcmp(local_vars_table[i], id)) {
			 return i;
		 }
	 }
	 return -1;
}

%}

%%

goal:	program
	;

program :
        function_or_var_list;

function_or_var_list:
        function_or_var_list function
        | function_or_var_list global_var
        | /*empty */
	;

function:
         var_type WORD
         {
		 fprintf(fasm, "\t.text\n");
		 fprintf(fasm, ".globl %s\n", $2);
		 fprintf(fasm, "%s:\n", $2);

		 fprintf(fasm, "# Save registers\n");
		 fprintf(fasm, "\tpushq %%rbx\n");
		 fprintf(fasm, "\tpushq %%r10\n");
		 fprintf(fasm, "\tpushq %%r13\n");
		 fprintf(fasm, "\tpushq %%r14\n");
		 fprintf(fasm, "\tpushq %%r15\n");
		 fprintf(fasm, "\tpushq %%rbp\n");
		 fprintf(fasm, "\tsubq $%d,%%rsp\n", 8*MAX_LOCALS); // Reserve space for args and locals
		 nlocals = 0;

	 }
	 LPARENT arguments RPARENT 
         {
		 int i;
		 fprintf(fasm, "\t#Save arguments\n");
		 for (i=0; i<nlocals;i++) {
		     fprintf(fasm, "\tmovq %%%s,%d(%%rsp)\n",
			     regArgs[i], 8*(MAX_LOCALS-i) );
		 }
         }
compound_statement
         {
		 fprintf(fasm, "\taddq $%d,%%rsp\n", 8*MAX_LOCALS); // Restore space in stack for local vars
		 fprintf(fasm, "# Restore registers\n");
		 fprintf(fasm, "\tpopq %%rbp\n");
		 fprintf(fasm, "\tpopq %%r15\n");
		 fprintf(fasm, "\tpopq %%r14\n");
		 fprintf(fasm, "\tpopq %%r13\n");
		 fprintf(fasm, "\tpopq %%r10\n");
		 fprintf(fasm, "\tpopq %%rbx\n");
		 fprintf(fasm, "\tret\n", $2);
         }
	;

arg_list:
         arg
         | arg_list COMA arg
	 ;

arguments:
         arg_list
	 | /*empty*/
	 ;

arg: var_type WORD {
        char * id = $<string_val>2;
        addLocalVar(id, current_type/*current_type*/);
}
;

global_var: 
        var_type global_var_list SEMICOLON;

global_var_list: WORD {
 	fprintf(fasm," # Reserve space\n");
	fprintf(fasm,"\t.data\n");
	fprintf(fasm, "%s:\n", $<string_val>1); 
	fprintf(fasm, "\t.long 0\n");
	fprintf(fasm, "\t.long 0\n");
	fprintf(fasm,"\n");
	addGlobalVar($<string_val>1, current_type);
        }
| global_var_list COMA WORD {
 	fprintf(fasm," # Reserve space\n");
	fprintf(fasm,"\t.data\n");
	fprintf(fasm, "%s:\n", $<string_val>3); 
	fprintf(fasm, "\t.long 0\n");
	fprintf(fasm, "\t.long 0\n");
	fprintf(fasm,"\n");
	addGlobalVar($<string_val>3, current_type);
}
        ;

var_type: CHARSTAR {current_type = 0;} | CHARSTARSTAR {current_type = 1;} | LONG {current_type = 1;}| LONGSTAR {current_type = 1;} | VOID {current_type = 1;};

assignment:
         WORD EQUAL expression {

                 char * id = $<string_val>1;
                 int i = lookupLocalVar(id);
                 
                 if (i>=0) {
                         fprintf(fasm, "\t#Assign to Local var %s\n", id);
                         fprintf(fasm, "\tmovq %%%s, %d(%%rsp)\n",
                                 regStk[top-1], 8*(MAX_LOCALS-i) );
                 }
                 else {
                         fprintf(fasm, "\t#Assign to Global var %s\n", id);
                         fprintf(fasm, "\tmovq %%%s, %s\n",
                                 regStk[top-1], id);
                 }
                 top--;
	 }
	 | WORD LBRACE expression{
	 		fprintf(fasm, "#dereference the pointer from here\n");
	 		char * id = $<string_val>1;
            int i = lookupLocalVar(id);
           
            
            if(i>=0){
            
            	fprintf(fasm, "\tmovq %d(%%rsp), %%rbp \n",8*(MAX_LOCALS-i));
            	localCharStarFlag = local_vars_type[i];
            	
            }else{
            	i = lookupGlobalVar(id);
            	fprintf(fasm, "\tmovq %s, %%rbp\n", id);
            	fprintf(fasm, "\n#GOBAL ARRAY RECOGNIZED\n");
            	localCharStarFlag = global_vars_type[i];
            }
            
	 		//fprintf(fasm, "\tmovq %%%s, %%rdi\n", $<string_val>1);
	 		if(localCharStarFlag != 0){
	 			fprintf(fasm, "\timulq $8, %%%s\n", regStk[top - 1]);////////assume it is long, so 8 bytes for long
	 		}else{
	 			fprintf(fasm, "\timulq $1, %%%s\n", regStk[top - 1]);//char type
	 		}
	 		fprintf(fasm, "\taddq %%%s, %%rbp\n", regStk[top - 1]);//expression is the offset, not sure if its add or minus
	 } RBRACE EQUAL expression{
	 		if(localCharStarFlag != 0){
	 			fprintf(fasm, "# dereference the array here\n");//long type
	 			fprintf(fasm, "\tmovq %%%s, (%%rbp)\n", regStk[top - 1]);
	 		}else{
	 			fprintf(fasm, "\tandq $255, %%%s\n", regStk[top - 1]);
	 			fprintf(fasm, "\tmovq %%%s, (%%rbp)\n", regStk[top - 1]);//char type
	 		}
	 }
	 ;

call :
         WORD LPARENT  call_arguments RPARENT {
		 char * funcName = $<string_val>1;
		 int nargs = $<nargs>3;
		 int i;
		 fprintf(fasm,"     # func=%s nargs=%d\n", funcName, nargs);
     		 fprintf(fasm,"     # Move values from reg stack to reg args\n");
		 for (i=nargs-1; i>=0; i--) {
			top--;
			fprintf(fasm, "\tmovq %%%s, %%%s\n",
			  regStk[top], regArgs[i]);
		 }
		 if (!strcmp(funcName, "printf")) {
			 // printf has a variable number of arguments
			 // and it need the following
			 fprintf(fasm, "\tmovl    $0, %%eax\n");
		 }
		 fprintf(fasm, "\tcall %s\n", funcName);
		 fprintf(fasm, "\tmovq %%rax, %%%s\n", regStk[top]);
		 top++;
         }
      ;

call_arg_list:
         expression {
		$<nargs>$=1;
	 }
         | call_arg_list COMA expression {
		$<nargs>$++;
	 }

	 ;

call_arguments:
         call_arg_list { $<nargs>$=$<nargs>1; }
	 | /*empty*/ { $<nargs>$=0;}
	 ;

expression :
         logical_or_expr
	 ;

logical_or_expr:
         logical_and_expr
	 | logical_or_expr OROR logical_and_expr{
	 		fprintf(fasm, "\t# logical OR operator\n");
	 		fprintf(fasm, "\torq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
	 		top--;
	 }
	 ;

logical_and_expr:
         equality_expr
	 | logical_and_expr ANDAND equality_expr{
	 		fprintf(fasm, "\t# logical AND operator\n");
	 		fprintf(fasm, "\tandq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
	 		top--;
	 }
	 ;

equality_expr:
         relational_expr
	 | equality_expr EQUALEQUAL relational_expr{
	 		fprintf(fasm, "\t# Equal Equal operator\n");
	 		fprintf(fasm, "\tcmpq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
	 		fprintf(fasm, "\tje LC%d\n", (jumpingLabel+1));
	 		fprintf(fasm, "LC%d:\n",jumpingLabel);
	 		fprintf(fasm, "\tmovq $0, %%%s\n", regStk[top-2]);
	 		fprintf(fasm, "\tjmp LC%d\n", (jumpingLabel+2));
	 		fprintf(fasm, "LC%d:\n", (jumpingLabel+1));
	 		fprintf(fasm, "\tmovq $1, %%%s\n", regStk[top-2]);
	 		fprintf(fasm, "LC%d:\n", (jumpingLabel+2));
	 		top--;
	 		jumpingLabel = jumpingLabel + 3;
	 }
	 | equality_expr NOTEQUAL relational_expr{
	 		fprintf(fasm, "\t# Not Equal operator\n");
	 		fprintf(fasm, "\tcmpq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
	 		fprintf(fasm, "\tjne LC%d\n", (jumpingLabel+1));
	 		fprintf(fasm, "LC%d:\n",jumpingLabel);
	 		fprintf(fasm, "\tmovq $0, %%%s\n", regStk[top-2]);
	 		fprintf(fasm, "\tjmp LC%d\n", (jumpingLabel+2));
	 		fprintf(fasm, "LC%d:\n", (jumpingLabel+1));
	 		fprintf(fasm, "\tmovq $1, %%%s\n", regStk[top-2]);
	 		fprintf(fasm, "LC%d:\n", (jumpingLabel+2));
	 		top--;
	 		jumpingLabel = jumpingLabel + 3;
	 }
	 ;

relational_expr:
         additive_expr
	 | relational_expr LESS additive_expr{
	 		fprintf(fasm, "\t# Equal Equal operator\n");
	 		fprintf(fasm, "\tcmpq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
	 		fprintf(fasm, "\tjl LC%d\n", (jumpingLabel+1));
	 		fprintf(fasm, "LC%d:\n",jumpingLabel);
	 		fprintf(fasm, "\tmovq $0, %%%s\n", regStk[top-2]);
	 		fprintf(fasm, "\tjmp LC%d\n", (jumpingLabel+2));
	 		fprintf(fasm, "LC%d:\n", (jumpingLabel+1));
	 		fprintf(fasm, "\tmovq $1, %%%s\n", regStk[top-2]);
	 		fprintf(fasm, "LC%d:\n", (jumpingLabel+2));
	 		top--;
	 		jumpingLabel = jumpingLabel + 3;
	 }
	 | relational_expr GREAT additive_expr{
	 		fprintf(fasm, "\t# Equal Equal operator\n");
	 		fprintf(fasm, "\tcmpq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
	 		fprintf(fasm, "\tjg LC%d\n", (jumpingLabel+1));
	 		fprintf(fasm, "LC%d:\n",jumpingLabel);
	 		fprintf(fasm, "\tmovq $0, %%%s\n", regStk[top-2]);
	 		fprintf(fasm, "\tjmp LC%d\n", (jumpingLabel+2));
	 		fprintf(fasm, "LC%d:\n", (jumpingLabel+1));
	 		fprintf(fasm, "\tmovq $1, %%%s\n", regStk[top-2]);
	 		fprintf(fasm, "LC%d:\n", (jumpingLabel+2));
	 		top--;
	 		jumpingLabel = jumpingLabel + 3;
	 }
	 | relational_expr LESSEQUAL additive_expr{
	 		fprintf(fasm, "\t# Equal Equal operator\n");
	 		fprintf(fasm, "\tcmpq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
	 		fprintf(fasm, "\tjle LC%d\n", (jumpingLabel+1));
	 		fprintf(fasm, "LC%d:\n",jumpingLabel);
	 		fprintf(fasm, "\tmovq $0, %%%s\n", regStk[top-2]);
	 		fprintf(fasm, "\tjmp LC%d\n", (jumpingLabel+2));
	 		fprintf(fasm, "LC%d:\n", (jumpingLabel+1));
	 		fprintf(fasm, "\tmovq $1, %%%s\n", regStk[top-2]);
	 		fprintf(fasm, "LC%d:\n", (jumpingLabel+2));
	 		top--;
	 		jumpingLabel = jumpingLabel + 3;
	 }
	 | relational_expr GREATEQUAL additive_expr{
	 		fprintf(fasm, "\t# Equal Equal operator\n");
	 		fprintf(fasm, "\tcmpq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
	 		fprintf(fasm, "\tjge LC%d\n", (jumpingLabel+1));
	 		fprintf(fasm, "LC%d:\n",jumpingLabel);
	 		fprintf(fasm, "\tmovq $0, %%%s\n", regStk[top-2]);
	 		fprintf(fasm, "\tjmp LC%d\n", (jumpingLabel+2));
	 		fprintf(fasm, "LC%d:\n", (jumpingLabel+1));
	 		fprintf(fasm, "\tmovq $1, %%%s\n", regStk[top-2]);
	 		fprintf(fasm, "LC%d:\n", (jumpingLabel+2));
	 		top--;
	 		jumpingLabel = jumpingLabel + 3;
	 }
	 ;

additive_expr:
          multiplicative_expr
	  | additive_expr PLUS multiplicative_expr {
		fprintf(fasm,"\n\t# +\n");
		if (top<=nregStk) {
			fprintf(fasm, "\taddq %%%s,%%%s\n", 
				regStk[top-1], regStk[top-2]);
			top--;
		}
	  }
	  | additive_expr MINUS multiplicative_expr{
                fprintf(fasm, "\n\t# minus\n");
                if(top<=nregStk){
                        fprintf(fasm, "\tsubq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
                        top--;
                }
          }
	  ;

multiplicative_expr:
          primary_expr
	  | multiplicative_expr TIMES primary_expr {
		fprintf(fasm,"\n\t# *\n");
		if (top<=nregStk) {
			fprintf(fasm, "\timulq %%%s,%%%s\n", 
				regStk[top-1], regStk[top-2]);
			top--;
		}
          }
	  | multiplicative_expr DIVIDE primary_expr{
	  			fprintf(fasm, "\n\t# division \n");
                if(top<=nregStk){
                    fprintf(fasm, "\tmovq $0, %%rdx\n");
                    fprintf(fasm, "\tmovq %%%s, %%rax\n", regStk[top-2]);
                    fprintf(fasm, "\tidivq %%%s\n", regStk[top-1]);
                    fprintf(fasm, "\tmovq %%rax, %%%s\n", regStk[top-2]);
                    top--;
                }
	  }
	  | multiplicative_expr PERCENT primary_expr{
	  			fprintf(fasm, "\n\t# %\n");
                if(top<=nregStk){
                    fprintf(fasm, "\tmovq $0,%%rdx \n");
                    fprintf(fasm, "\tmovq %%%s, %%rax\n",regStk[top-2]);
                    fprintf(fasm, "\tidivq %%%s\n", regStk[top-1]);
                    fprintf(fasm, "\tmovq %%rdx, %%%s\n", regStk[top-2]);
                    top--;
                } 
	  }
	  ;

primary_expr:
	  STRING_CONST {
		  // Add string to string table.
		  // String table will be produced later
		  string_table[nstrings]=$<string_val>1;
		  fprintf(fasm, "\t#top=%d\n", top);
		  fprintf(fasm, "\n\t# push string %s top=%d\n",
			  $<string_val>1, top);
		  if (top<=nregStk) {
		  	fprintf(fasm, "\tmovq $string%d, %%%s\n", 
				nstrings, regStk[top]);
			//fprintf(fasm, "\tmovq $%s,%%%s\n", 
				//$<string_val>1, regStk[top]);
			top++;
		  }
		  nstrings++;
	  }
          | call
	  | WORD {
  		// Lookup local var
		 int i;
 	         char * id = $<string_val>1;
		 i = lookupLocalVar(id);
		 if (i>=0) {
			 fprintf(fasm, "\t#Push Local var %s\n", id);
			 fprintf(fasm, "\tmovq %d(%%rsp), %%%s\n", 8*(MAX_LOCALS-i), 
regStk[top] );
			 top++;
		 }
		 else {
			 // Global var
			 fprintf(fasm, "\tmovq %s, %%%s\n", id, regStk[top]);
			 top++;
		 }
	  }
	  | WORD LBRACE expression RBRACE{
	  		fprintf(fasm, "# Array Value\n");
	  		char * id = $<string_val>1;
            int i = lookupLocalVar(id);
            
            
            if(i>=0){
            
            	fprintf(fasm, "\tmovq %d(%%rsp), %%%s\n",8*(MAX_LOCALS-i), regStk[top]);
            	localCharStarFlag = local_vars_type[i];
            }else{
            	i = lookupGlobalVar(id);
            	fprintf(fasm, "\tmovq %s, %%%s\n",id, regStk[top]);
            	//fprintf(fasm, "\tmovq %s, %%rbp\n", id);
            	localCharStarFlag = global_vars_type[i];
            	fprintf(fasm, "\n#GLOBAL ARRAY RECOGNIZED\n");
            }
            
            if(localCharStarFlag != 0){
            	fprintf(fasm, "\timulq $8, %%%s\n", regStk[top - 1]);
            }else{
            	fprintf(fasm, "\timulq $1, %%%s\n", regStk[top - 1]);
            }
            fprintf(fasm, "\taddq %%%s, %%%s\n", regStk[top - 1], regStk[top]);
            fprintf(fasm, "\tmovq (%%%s), %%%s\n", regStk[top], regStk[top]);
            fprintf(fasm, "\tmovq %%%s, %%%s\n", regStk[top], regStk[top - 1]);
            if(localCharStarFlag == 0){
            	fprintf(fasm, "\tandq $255, %%%s\n", regStk[top - 1]);
            }
	  		//top;
	  		
	  }
	  | AMPERSAND WORD{
	  		int i;
 	        char * id = $<string_val>2;
 	        i = lookupLocalVar(id);
 	        if (i>=0) {
			 fprintf(fasm, "#Ampersand var %s\n", id);
			 fprintf(fasm, "\tmovq %%rsp, %%%s\n", regStk[top]);
			 fprintf(fasm, "\taddq $%d, %%%s\n", 8*(MAX_LOCALS-i), regStk[top] );
			 top++;
		 }
		 else {
			 // Global var
			 //fprintf(fasm, "\tmovq %s, %%%s\n", id, regStk[top]);
			 //top++;
		 }
 	        
	  }
	  | INTEGER_CONST {
		  fprintf(fasm, "\n\t# push %s\n", $<string_val>1);
		  if (top<=nregStk) {
			fprintf(fasm, "\tmovq $%s,%%%s\n", 
				$<string_val>1, regStk[top]);
			top++;
		  }
	  }
	  | LPARENT expression RPARENT
	  ;

compound_statement:
	 LCURLY {
	 	tempNLocal[countTempNLocal] = nlocals;
	 	countTempNLocal++;
	 } statement_list RCURLY{
	 	nlocals = tempNLocal[countTempNLocal - 1];
	 	countTempNLocal--;
	 }
	 ;

statement_list:
         statement_list statement
	 | /*empty*/
	 ;

local_var:
        var_type local_var_list SEMICOLON;

local_var_list: WORD {
	addLocalVar($<string_val>1, current_type);
        }
        | local_var_list COMA WORD {
		addLocalVar($<string_val>3, current_type);
	}
        ;

statement:
         assignment SEMICOLON{
         fprintf(fasm, "################# top = 0 ############\n");
         top = 0;}
	 | call SEMICOLON {
	 	top = 0; /////////////////////top--?
	 	fprintf(fasm, "################# top = 0 ############\n");
	 	//top--;
	 }
	 | local_var
	 | compound_statement
	 | IF{
	 		$<my_nlabel>1 = nlabel;
	 		//block 1
	 		nlabel++;
	 		fprintf(fasm, "\t#start the if statement\n");
	 		fprintf(fasm, "if_statement_%d:\n", $<my_nlabel>1);
	 } LPARENT expression RPARENT{
	 		//block 2
	 		fprintf(fasm, "\tcmpq $0, %%%s\n", regStk[top-1]);
	 		fprintf(fasm, "\tje if_else_%d\n", $<my_nlabel>1);
	 } statement{
	 		fprintf(fasm, "\tjmp if_end_%d\n", $<my_nlabel>1);
	 		fprintf(fasm, "if_else_%d:\n", $<my_nlabel>1);
	 } else_optional{
	 		fprintf(fasm, "if_end_%d:\n", $<my_nlabel>1);
	 }
	 | WHILE LPARENT {
		// act 1
		latestWhileN = nlabel;
		LoopTypeFlag = 1;	//1 for while; 2 for do while; 3 for for loop
		$<my_nlabel>1=nlabel;
		nlabel++;
		fprintf(fasm, "while_start_%d:\n", $<my_nlabel>1);
         }
         expression RPARENT {
		// act2
		fprintf(fasm, "\tcmpq $0, %%rbx\n");
		fprintf(fasm, "\tje while_end_%d\n", $<my_nlabel>1);
		top--;
         }
         statement {
		// act3
		fprintf(fasm, "\tjmp while_start_%d\n", $<my_nlabel>1);
		fprintf(fasm, "while_end_%d:\n", $<my_nlabel>1);
	 }
	 | DO {
	 		//block 1
	 		latestDoWhileN = nlabel;
	 		LoopTypeFlag = 2;	//1 for while; 2 for do while; 3 for for loop
	 		$<my_nlabel>1 = nlabel;
	 		nlabel++;
	 		fprintf(fasm, "\t#start the Do While statement\n");
	 		fprintf(fasm, "do_statement_%d:\n", $<my_nlabel>1);
	 		
	 } statement {
	 		fprintf(fasm, "do_update_%d:\n", $<my_nlabel>1);
	 } WHILE LPARENT expression RPARENT {
	 		
	 		fprintf(fasm, "\tcmpq $1, %%%s\n", regStk[top-1]);
	 		fprintf(fasm, "\tje do_statement_%d\n", $<my_nlabel>1);
	 		
	 		fprintf(fasm, "do_endAll_%d:\n", $<my_nlabel>1);
	 } SEMICOLON
	 | FOR{
	 		//block 1
	 		latestForN = nlabel;
	 		LoopTypeFlag = 3;	//1 for while; 2 for do while; 3 for for loop
	 		fprintf(fasm, "\t#start the For statement\n");
	 		$<my_nlabel>1 = nlabel;
	 		nlabel++;
	 		//top = 0;
	 } LPARENT assignment SEMICOLON {
	 		//block 2
	 		fprintf(fasm, "for_evaluation_%d:\n", $<my_nlabel>1);
	 }expression  SEMICOLON {
	 		//block 3	
	 		fprintf(fasm, "\tcmpq $0, %%%s\n", regStk[top-1]);
	 		fprintf(fasm, "\tjne for_statement_%d\n", $<my_nlabel>1);
	 		fprintf(fasm, "\tjmp for_endAll_%d\n", $<my_nlabel>1);
	 		fprintf(fasm, "for_update_%d:\n", $<my_nlabel>1);
	 }
	  assignment {
	   		fprintf(fasm, "\tjmp for_evaluation_%d\n", $<my_nlabel>1);
	   		fprintf(fasm, "for_statement_%d:\n", $<my_nlabel>1);
	   } RPARENT statement{
	   		//end blocks
	   		fprintf(fasm, "\tjmp for_update_%d\n", $<my_nlabel>1);
	   		fprintf(fasm, "for_endAll_%d:\n", $<my_nlabel>1);
	   }
	 | jump_statement
	 ;

else_optional:
         ELSE  statement
	 | /* empty */
         ;

jump_statement:
    CONTINUE SEMICOLON{
     	fprintf(fasm, "###################handling break############################\n");
	 	if(latestWhileN > latestForN && latestWhileN > latestDoWhileN){
	 		fprintf(fasm, "\tjmp while_start_%d\n", latestWhileN);
	 	}else if(latestDoWhileN > latestWhileN && latestDoWhileN > latestForN){
	 		fprintf(fasm, "\tjmp do_update_%d\n", latestDoWhileN);
	 	}else if(latestForN > latestWhileN && latestForN > latestDoWhileN){
	 		fprintf(fasm, "\tjmp for_update_%d\n", latestForN);
	 	}    
     }
	 | BREAK SEMICOLON{
	 	//LoopTypeFlag: 1 for while; 2 for do while; 3 for for loop
	 	fprintf(fasm, "###################handling break############################\n");
	 	if(latestWhileN > latestForN && latestWhileN > latestDoWhileN){
	 		fprintf(fasm, "\tjmp while_end_%d\n", latestWhileN);
	 	}else if(latestDoWhileN > latestWhileN && latestDoWhileN > latestForN){
	 		fprintf(fasm, "\tjmp do_endAll_%d\n", latestDoWhileN);
	 	}else if(latestForN > latestWhileN && latestForN > latestDoWhileN){
	 		fprintf(fasm, "\tjmp for_endAll_%d\n", latestForN);
	 	}
	 }
	 | RETURN expression SEMICOLON {
		 fprintf(fasm, "\tmovq %%rbx, %%rax\n");
		 //fprintf(fasm, "\tret\n");
		 fprintf(fasm, "\taddq $%d,%%rsp\n", 8*MAX_LOCALS); // Restore space in stack for local vars
		 fprintf(fasm, "# Restore registers\n");
		 fprintf(fasm, "\tpopq %%rbp\n");
		 fprintf(fasm, "\tpopq %%r15\n");
		 fprintf(fasm, "\tpopq %%r14\n");
		 fprintf(fasm, "\tpopq %%r13\n");
		 fprintf(fasm, "\tpopq %%r10\n");
		 fprintf(fasm, "\tpopq %%rbx\n");
		 fprintf(fasm, "\tret\n");
		 fprintf(fasm, "######return statments################\n");
		 top = 0;
	 }
	 ;

%%

void yyset_in (FILE *  in_str );

int
yyerror(const char * s)
{
	fprintf(stderr,"%s:%d: %s\n", input_file, line_number, s);
}


int
main(int argc, char **argv)
{
	printf("-------------WARNING: You need to implement global and local vars ------\n");
	printf("------------- or you may get problems with top------\n");
	
	// Make sure there are enough arguments
	if (argc <2) {
		fprintf(stderr, "Usage: simple file\n");
		exit(1);
	}

	// Get file name
	input_file = strdup(argv[1]);

	int len = strlen(input_file);
	if (len < 2 || input_file[len-2]!='.' || input_file[len-1]!='c') {
		fprintf(stderr, "Error: file extension is not .c\n");
		exit(1);
	}

	// Get assembly file name
	asm_file = strdup(input_file);
	asm_file[len-1]='s';

	// Open file to compile
	FILE * f = fopen(input_file, "r");
	if (f==NULL) {
		fprintf(stderr, "Cannot open file %s\n", input_file);
		perror("fopen");
		exit(1);
	}

	// Create assembly file
	fasm = fopen(asm_file, "w");
	if (fasm==NULL) {
		fprintf(stderr, "Cannot open file %s\n", asm_file);
		perror("fopen");
		exit(1);
	}

	// Uncomment for debugging
	//fasm = stderr;

	// Create compilation file
	// 
	yyset_in(f);
	yyparse();

	// Generate string table
	int i;
	for (i = 0; i<nstrings; i++) {
		fprintf(fasm, "string%d:\n", i);
		fprintf(fasm, "\t.string %s\n\n", string_table[i]);
	}

	fclose(f);
	fclose(fasm);

	return 0;
}


