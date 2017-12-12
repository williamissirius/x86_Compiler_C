/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.3"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Using locations.  */
#define YYLSP_NEEDED 0



/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     WORD = 258,
     NOTOKEN = 259,
     LPARENT = 260,
     RPARENT = 261,
     LBRACE = 262,
     RBRACE = 263,
     LCURLY = 264,
     RCURLY = 265,
     COMA = 266,
     SEMICOLON = 267,
     EQUAL = 268,
     STRING_CONST = 269,
     LONG = 270,
     LONGSTAR = 271,
     VOID = 272,
     CHARSTAR = 273,
     CHARSTARSTAR = 274,
     INTEGER_CONST = 275,
     AMPERSAND = 276,
     OROR = 277,
     ANDAND = 278,
     EQUALEQUAL = 279,
     NOTEQUAL = 280,
     LESS = 281,
     GREAT = 282,
     LESSEQUAL = 283,
     GREATEQUAL = 284,
     PLUS = 285,
     MINUS = 286,
     TIMES = 287,
     DIVIDE = 288,
     PERCENT = 289,
     IF = 290,
     ELSE = 291,
     WHILE = 292,
     DO = 293,
     FOR = 294,
     CONTINUE = 295,
     BREAK = 296,
     RETURN = 297
   };
#endif
/* Tokens.  */
#define WORD 258
#define NOTOKEN 259
#define LPARENT 260
#define RPARENT 261
#define LBRACE 262
#define RBRACE 263
#define LCURLY 264
#define RCURLY 265
#define COMA 266
#define SEMICOLON 267
#define EQUAL 268
#define STRING_CONST 269
#define LONG 270
#define LONGSTAR 271
#define VOID 272
#define CHARSTAR 273
#define CHARSTARSTAR 274
#define INTEGER_CONST 275
#define AMPERSAND 276
#define OROR 277
#define ANDAND 278
#define EQUALEQUAL 279
#define NOTEQUAL 280
#define LESS 281
#define GREAT 282
#define LESSEQUAL 283
#define GREATEQUAL 284
#define PLUS 285
#define MINUS 286
#define TIMES 287
#define DIVIDE 288
#define PERCENT 289
#define IF 290
#define ELSE 291
#define WHILE 292
#define DO 293
#define FOR 294
#define CONTINUE 295
#define BREAK 296
#define RETURN 297




/* Copy the first part of user declarations.  */


/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif

#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 12 "simple.y"
{
		char   *string_val;
		int nargs;
		int my_nlabel;
	}
/* Line 193 of yacc.c.  */
#line 187 "y.tab.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */
#line 18 "simple.y"

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



/* Line 216 of yacc.c.  */
#line 290 "y.tab.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int i)
#else
static int
YYID (i)
    int i;
#endif
{
  return i;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss;
  YYSTYPE yyvs;
  };

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack)					\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack, Stack, yysize);				\
	Stack = &yyptr->Stack;						\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  4
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   141

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  43
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  46
/* YYNRULES -- Number of rules.  */
#define YYNRULES  90
/* YYNRULES -- Number of states.  */
#define YYNSTATES  158

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   297

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    13,    14,    15,    16,
      25,    27,    31,    33,    34,    37,    41,    43,    47,    49,
      51,    53,    55,    57,    61,    62,    70,    75,    77,    81,
      83,    84,    86,    88,    92,    94,    98,   100,   104,   108,
     110,   114,   118,   122,   126,   128,   132,   136,   138,   142,
     146,   150,   152,   154,   156,   161,   164,   166,   170,   171,
     176,   179,   180,   184,   186,   190,   193,   196,   198,   200,
     201,   202,   203,   213,   214,   215,   223,   224,   225,   226,
     237,   238,   239,   240,   241,   255,   257,   260,   261,   264,
     267
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      44,     0,    -1,    45,    -1,    46,    -1,    46,    47,    -1,
      46,    53,    -1,    -1,    -1,    -1,    55,     3,    48,     5,
      51,     6,    49,    69,    -1,    52,    -1,    50,    11,    52,
      -1,    50,    -1,    -1,    55,     3,    -1,    55,    54,    12,
      -1,     3,    -1,    54,    11,     3,    -1,    18,    -1,    19,
      -1,    15,    -1,    16,    -1,    17,    -1,     3,    13,    61,
      -1,    -1,     3,     7,    61,    57,     8,    13,    61,    -1,
       3,     5,    60,     6,    -1,    61,    -1,    59,    11,    61,
      -1,    59,    -1,    -1,    62,    -1,    63,    -1,    62,    22,
      63,    -1,    64,    -1,    63,    23,    64,    -1,    65,    -1,
      64,    24,    65,    -1,    64,    25,    65,    -1,    66,    -1,
      65,    26,    66,    -1,    65,    27,    66,    -1,    65,    28,
      66,    -1,    65,    29,    66,    -1,    67,    -1,    66,    30,
      67,    -1,    66,    31,    67,    -1,    68,    -1,    67,    32,
      68,    -1,    67,    33,    68,    -1,    67,    34,    68,    -1,
      14,    -1,    58,    -1,     3,    -1,     3,     7,    61,     8,
      -1,    21,     3,    -1,    20,    -1,     5,    61,     6,    -1,
      -1,     9,    70,    71,    10,    -1,    71,    74,    -1,    -1,
      55,    73,    12,    -1,     3,    -1,    73,    11,     3,    -1,
      56,    12,    -1,    58,    12,    -1,    72,    -1,    69,    -1,
      -1,    -1,    -1,    35,    75,     5,    61,     6,    76,    74,
      77,    87,    -1,    -1,    -1,    37,     5,    78,    61,     6,
      79,    74,    -1,    -1,    -1,    -1,    38,    80,    74,    81,
      37,     5,    61,     6,    82,    12,    -1,    -1,    -1,    -1,
      -1,    39,    83,     5,    56,    12,    84,    61,    12,    85,
      56,    86,     6,    74,    -1,    88,    -1,    36,    74,    -1,
      -1,    40,    12,    -1,    41,    12,    -1,    42,    61,    12,
      -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   111,   111,   115,   118,   119,   120,   125,   142,   124,
     165,   166,   170,   171,   174,   181,   183,   192,   203,   203,
     203,   203,   203,   206,   223,   223,   260,   283,   286,   293,
     294,   298,   302,   303,   311,   312,   320,   321,   334,   350,
     351,   364,   377,   390,   406,   407,   415,   425,   426,   434,
     444,   457,   473,   474,   491,   523,   540,   548,   552,   552,
     562,   563,   567,   569,   572,   578,   581,   586,   587,   588,
     594,   598,   588,   604,   612,   604,   623,   632,   634,   623,
     641,   649,   652,   659,   641,   667,   671,   672,   676,   686,
     697
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "WORD", "NOTOKEN", "LPARENT", "RPARENT",
  "LBRACE", "RBRACE", "LCURLY", "RCURLY", "COMA", "SEMICOLON", "EQUAL",
  "STRING_CONST", "LONG", "LONGSTAR", "VOID", "CHARSTAR", "CHARSTARSTAR",
  "INTEGER_CONST", "AMPERSAND", "OROR", "ANDAND", "EQUALEQUAL", "NOTEQUAL",
  "LESS", "GREAT", "LESSEQUAL", "GREATEQUAL", "PLUS", "MINUS", "TIMES",
  "DIVIDE", "PERCENT", "IF", "ELSE", "WHILE", "DO", "FOR", "CONTINUE",
  "BREAK", "RETURN", "$accept", "goal", "program", "function_or_var_list",
  "function", "@1", "@2", "arg_list", "arguments", "arg", "global_var",
  "global_var_list", "var_type", "assignment", "@3", "call",
  "call_arg_list", "call_arguments", "expression", "logical_or_expr",
  "logical_and_expr", "equality_expr", "relational_expr", "additive_expr",
  "multiplicative_expr", "primary_expr", "compound_statement", "@4",
  "statement_list", "local_var", "local_var_list", "statement", "@5", "@6",
  "@7", "@8", "@9", "@10", "@11", "@12", "@13", "@14", "@15", "@16",
  "else_optional", "jump_statement", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    43,    44,    45,    46,    46,    46,    48,    49,    47,
      50,    50,    51,    51,    52,    53,    54,    54,    55,    55,
      55,    55,    55,    56,    57,    56,    58,    59,    59,    60,
      60,    61,    62,    62,    63,    63,    64,    64,    64,    65,
      65,    65,    65,    65,    66,    66,    66,    67,    67,    67,
      67,    68,    68,    68,    68,    68,    68,    68,    70,    69,
      71,    71,    72,    73,    73,    74,    74,    74,    74,    75,
      76,    77,    74,    78,    79,    74,    80,    81,    82,    74,
      83,    84,    85,    86,    74,    74,    87,    87,    88,    88,
      88
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     1,     2,     2,     0,     0,     0,     8,
       1,     3,     1,     0,     2,     3,     1,     3,     1,     1,
       1,     1,     1,     3,     0,     7,     4,     1,     3,     1,
       0,     1,     1,     3,     1,     3,     1,     3,     3,     1,
       3,     3,     3,     3,     1,     3,     3,     1,     3,     3,
       3,     1,     1,     1,     4,     2,     1,     3,     0,     4,
       2,     0,     3,     1,     3,     2,     2,     1,     1,     0,
       0,     0,     9,     0,     0,     7,     0,     0,     0,    10,
       0,     0,     0,     0,    13,     1,     2,     0,     2,     2,
       3
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       6,     0,     2,     3,     1,    20,    21,    22,    18,    19,
       4,     5,     0,    16,     0,     0,     0,    15,    13,    17,
      12,     0,    10,     0,     0,     8,    14,    11,     0,    58,
       9,    61,     0,     0,    59,    69,     0,    76,    80,     0,
       0,     0,     0,     0,     0,    68,    67,    60,    85,    30,
       0,     0,     0,    73,     0,     0,    88,    89,    53,     0,
      51,    56,     0,    52,     0,    31,    32,    34,    36,    39,
      44,    47,    63,     0,    65,    66,    29,     0,    27,    24,
      23,     0,     0,    77,     0,     0,     0,    55,    90,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    62,     0,    26,     0,     0,     0,     0,
       0,     0,     0,    57,    33,    35,    37,    38,    40,    41,
      42,    43,    45,    46,    48,    49,    50,    64,    28,     0,
      70,    74,     0,    81,    54,     0,     0,     0,     0,     0,
      25,    71,    75,     0,     0,    87,    78,    82,     0,    72,
       0,     0,    86,    79,    83,     0,     0,    84
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     1,     2,     3,    10,    15,    28,    20,    21,    22,
      11,    14,    42,    43,   106,    63,    76,    77,    64,    65,
      66,    67,    68,    69,    70,    71,    45,    31,    32,    46,
      73,    47,    52,   136,   145,    82,   137,    54,   109,   150,
      55,   139,   151,   155,   149,    48
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -80
static const yytype_int16 yypact[] =
{
     -80,    16,   -80,    48,   -80,   -80,   -80,   -80,   -80,   -80,
     -80,   -80,    55,    51,    -2,    56,    68,   -80,    48,   -80,
      62,    79,   -80,    83,    48,   -80,   -80,   -80,    78,   -80,
     -80,   -80,     8,     1,   -80,   -80,    84,   -80,   -80,    81,
      90,    39,    87,    98,    99,   -80,   -80,   -80,   -80,    39,
      39,    39,   107,   -80,    59,   108,   -80,   -80,    32,    39,
     -80,   -80,   111,   -80,   103,    95,    96,     4,    53,    10,
     -13,   -80,   -80,    40,   -80,   -80,   109,   112,   -80,   -80,
     -80,    39,    39,   -80,   118,    39,   116,   -80,   -80,    39,
      39,    39,    39,    39,    39,    39,    39,    39,    39,    39,
      39,    39,   120,   -80,    39,   -80,   117,   121,   122,    89,
       0,   119,   124,   -80,    96,     4,    53,    53,    10,    10,
      10,    10,   -13,   -13,   -80,   -80,   -80,   -80,   -80,   123,
     -80,   -80,   125,   -80,   -80,    39,    59,    59,    39,    39,
     -80,   -80,   -80,   127,   126,    93,   -80,   -80,    59,   -80,
     128,   118,   -80,   -80,   -80,   129,    59,   -80
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -80,   -80,   -80,   -80,   -80,   -80,   -80,   -80,   -80,   110,
     -80,   -80,    12,   -79,   -80,   -32,   -80,   -80,   -47,   -80,
      50,    47,   -37,    13,   -28,   -68,   113,   -80,   -80,   -80,
     -80,   -53,   -80,   -80,   -80,   -80,   -80,   -80,   -80,   -80,
     -80,   -80,   -80,   -80,   -80,   -80
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -8
static const yytype_int16 yytable[] =
{
      44,    83,    78,    79,    80,   111,    49,    50,    50,    16,
      17,    33,    86,    51,    51,    12,     4,    29,    34,    99,
     100,   101,    44,     5,     6,     7,     8,     9,    91,    92,
      23,   124,   125,   126,   107,   108,    23,    49,   112,    85,
      97,    98,    58,    35,    59,    36,    37,    38,    39,    40,
      41,   102,   103,    60,   116,   117,    -7,   128,    13,    61,
      62,    18,    33,     5,     6,     7,     8,     9,    29,   122,
     123,    19,   154,    24,     5,     6,     7,     8,     9,    93,
      94,    95,    96,   141,   142,    25,    26,    29,   140,    53,
      72,   143,   144,    56,    35,   152,    36,    37,    38,    39,
      40,    41,    57,   157,    44,    44,   118,   119,   120,   121,
      74,    75,    81,    84,    87,    88,    44,    89,   105,    90,
     104,   110,   113,   127,    44,   129,   132,   130,   131,   148,
     138,   133,   134,   146,    27,   156,   135,   115,   147,   114,
     153,    30
};

static const yytype_uint8 yycheck[] =
{
      32,    54,    49,    50,    51,    84,     5,     7,     7,    11,
      12,     3,    59,    13,    13,     3,     0,     9,    10,    32,
      33,    34,    54,    15,    16,    17,    18,    19,    24,    25,
      18,    99,   100,   101,    81,    82,    24,     5,    85,     7,
      30,    31,     3,    35,     5,    37,    38,    39,    40,    41,
      42,    11,    12,    14,    91,    92,     5,   104,     3,    20,
      21,     5,     3,    15,    16,    17,    18,    19,     9,    97,
      98,     3,   151,    11,    15,    16,    17,    18,    19,    26,
      27,    28,    29,   136,   137,     6,     3,     9,   135,     5,
       3,   138,   139,    12,    35,   148,    37,    38,    39,    40,
      41,    42,    12,   156,   136,   137,    93,    94,    95,    96,
      12,    12,     5,     5,     3,    12,   148,    22,     6,    23,
      11,     3,     6,     3,   156,     8,    37,     6,     6,    36,
       5,    12,     8,     6,    24,     6,    13,    90,    12,    89,
      12,    28
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    44,    45,    46,     0,    15,    16,    17,    18,    19,
      47,    53,    55,     3,    54,    48,    11,    12,     5,     3,
      50,    51,    52,    55,    11,     6,     3,    52,    49,     9,
      69,    70,    71,     3,    10,    35,    37,    38,    39,    40,
      41,    42,    55,    56,    58,    69,    72,    74,    88,     5,
       7,    13,    75,     5,    80,    83,    12,    12,     3,     5,
      14,    20,    21,    58,    61,    62,    63,    64,    65,    66,
      67,    68,     3,    73,    12,    12,    59,    60,    61,    61,
      61,     5,    78,    74,     5,     7,    61,     3,    12,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    11,    12,    11,     6,    57,    61,    61,    81,
       3,    56,    61,     6,    63,    64,    65,    65,    66,    66,
      66,    66,    67,    67,    68,    68,    68,     3,    61,     8,
       6,     6,    37,    12,     8,    13,    76,    79,     5,    84,
      61,    74,    74,    61,    61,    77,     6,    12,    36,    87,
      82,    85,    74,    12,    56,    86,     6,    74
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *bottom, yytype_int16 *top)
#else
static void
yy_stack_print (bottom, top)
    yytype_int16 *bottom;
    yytype_int16 *top;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; bottom <= top; ++bottom)
    YYFPRINTF (stderr, " %d", *bottom);
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      fprintf (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      fprintf (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}


/* Prevent warnings from -Wmissing-prototypes.  */

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */



/* The look-ahead symbol.  */
int yychar;

/* The semantic value of the look-ahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;



/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
  
  int yystate;
  int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Look-ahead token as an internal (translated) token number.  */
  int yytoken = 0;
#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack.  */
  yytype_int16 yyssa[YYINITDEPTH];
  yytype_int16 *yyss = yyssa;
  yytype_int16 *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  YYSTYPE *yyvsp;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  YYSIZE_T yystacksize = YYINITDEPTH;

  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;


  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;


	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),

		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss);
	YYSTACK_RELOCATE (yyvs);

#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;


      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     look-ahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to look-ahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a look-ahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid look-ahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the look-ahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 7:
#line 125 "simple.y"
    {
		 fprintf(fasm, "\t.text\n");
		 fprintf(fasm, ".globl %s\n", (yyvsp[(2) - (2)].string_val));
		 fprintf(fasm, "%s:\n", (yyvsp[(2) - (2)].string_val));

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
    break;

  case 8:
#line 142 "simple.y"
    {
		 int i;
		 fprintf(fasm, "\t#Save arguments\n");
		 for (i=0; i<nlocals;i++) {
		     fprintf(fasm, "\tmovq %%%s,%d(%%rsp)\n",
			     regArgs[i], 8*(MAX_LOCALS-i) );
		 }
         }
    break;

  case 9:
#line 151 "simple.y"
    {
		 fprintf(fasm, "\taddq $%d,%%rsp\n", 8*MAX_LOCALS); // Restore space in stack for local vars
		 fprintf(fasm, "# Restore registers\n");
		 fprintf(fasm, "\tpopq %%rbp\n");
		 fprintf(fasm, "\tpopq %%r15\n");
		 fprintf(fasm, "\tpopq %%r14\n");
		 fprintf(fasm, "\tpopq %%r13\n");
		 fprintf(fasm, "\tpopq %%r10\n");
		 fprintf(fasm, "\tpopq %%rbx\n");
		 fprintf(fasm, "\tret\n", (yyvsp[(2) - (8)].string_val));
         }
    break;

  case 14:
#line 174 "simple.y"
    {
        char * id = (yyvsp[(2) - (2)].string_val);
        addLocalVar(id, current_type/*current_type*/);
}
    break;

  case 16:
#line 183 "simple.y"
    {
 	fprintf(fasm," # Reserve space\n");
	fprintf(fasm,"\t.data\n");
	fprintf(fasm, "%s:\n", (yyvsp[(1) - (1)].string_val)); 
	fprintf(fasm, "\t.long 0\n");
	fprintf(fasm, "\t.long 0\n");
	fprintf(fasm,"\n");
	addGlobalVar((yyvsp[(1) - (1)].string_val), current_type);
        }
    break;

  case 17:
#line 192 "simple.y"
    {
 	fprintf(fasm," # Reserve space\n");
	fprintf(fasm,"\t.data\n");
	fprintf(fasm, "%s:\n", (yyvsp[(3) - (3)].string_val)); 
	fprintf(fasm, "\t.long 0\n");
	fprintf(fasm, "\t.long 0\n");
	fprintf(fasm,"\n");
	addGlobalVar((yyvsp[(3) - (3)].string_val), current_type);
}
    break;

  case 18:
#line 203 "simple.y"
    {current_type = 0;}
    break;

  case 19:
#line 203 "simple.y"
    {current_type = 1;}
    break;

  case 20:
#line 203 "simple.y"
    {current_type = 1;}
    break;

  case 21:
#line 203 "simple.y"
    {current_type = 1;}
    break;

  case 22:
#line 203 "simple.y"
    {current_type = 1;}
    break;

  case 23:
#line 206 "simple.y"
    {

                 char * id = (yyvsp[(1) - (3)].string_val);
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
    break;

  case 24:
#line 223 "simple.y"
    {
	 		fprintf(fasm, "#dereference the pointer from here\n");
	 		char * id = (yyvsp[(1) - (3)].string_val);
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
	 }
    break;

  case 25:
#line 248 "simple.y"
    {
	 		if(localCharStarFlag != 0){
	 			fprintf(fasm, "# dereference the array here\n");//long type
	 			fprintf(fasm, "\tmovq %%%s, (%%rbp)\n", regStk[top - 1]);
	 		}else{
	 			fprintf(fasm, "\tandq $255, %%%s\n", regStk[top - 1]);
	 			fprintf(fasm, "\tmovq %%%s, (%%rbp)\n", regStk[top - 1]);//char type
	 		}
	 }
    break;

  case 26:
#line 260 "simple.y"
    {
		 char * funcName = (yyvsp[(1) - (4)].string_val);
		 int nargs = (yyvsp[(3) - (4)].nargs);
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
    break;

  case 27:
#line 283 "simple.y"
    {
		(yyval.nargs)=1;
	 }
    break;

  case 28:
#line 286 "simple.y"
    {
		(yyval.nargs)++;
	 }
    break;

  case 29:
#line 293 "simple.y"
    { (yyval.nargs)=(yyvsp[(1) - (1)].nargs); }
    break;

  case 30:
#line 294 "simple.y"
    { (yyval.nargs)=0;}
    break;

  case 33:
#line 303 "simple.y"
    {
	 		fprintf(fasm, "\t# logical OR operator\n");
	 		fprintf(fasm, "\torq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
	 		top--;
	 }
    break;

  case 35:
#line 312 "simple.y"
    {
	 		fprintf(fasm, "\t# logical AND operator\n");
	 		fprintf(fasm, "\tandq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
	 		top--;
	 }
    break;

  case 37:
#line 321 "simple.y"
    {
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
    break;

  case 38:
#line 334 "simple.y"
    {
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
    break;

  case 40:
#line 351 "simple.y"
    {
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
    break;

  case 41:
#line 364 "simple.y"
    {
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
    break;

  case 42:
#line 377 "simple.y"
    {
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
    break;

  case 43:
#line 390 "simple.y"
    {
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
    break;

  case 45:
#line 407 "simple.y"
    {
		fprintf(fasm,"\n\t# +\n");
		if (top<=nregStk) {
			fprintf(fasm, "\taddq %%%s,%%%s\n", 
				regStk[top-1], regStk[top-2]);
			top--;
		}
	  }
    break;

  case 46:
#line 415 "simple.y"
    {
                fprintf(fasm, "\n\t# minus\n");
                if(top<=nregStk){
                        fprintf(fasm, "\tsubq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
                        top--;
                }
          }
    break;

  case 48:
#line 426 "simple.y"
    {
		fprintf(fasm,"\n\t# *\n");
		if (top<=nregStk) {
			fprintf(fasm, "\timulq %%%s,%%%s\n", 
				regStk[top-1], regStk[top-2]);
			top--;
		}
          }
    break;

  case 49:
#line 434 "simple.y"
    {
	  			fprintf(fasm, "\n\t# division \n");
                if(top<=nregStk){
                    fprintf(fasm, "\tmovq $0, %%rdx\n");
                    fprintf(fasm, "\tmovq %%%s, %%rax\n", regStk[top-2]);
                    fprintf(fasm, "\tidivq %%%s\n", regStk[top-1]);
                    fprintf(fasm, "\tmovq %%rax, %%%s\n", regStk[top-2]);
                    top--;
                }
	  }
    break;

  case 50:
#line 444 "simple.y"
    {
	  			fprintf(fasm, "\n\t# %\n");
                if(top<=nregStk){
                    fprintf(fasm, "\tmovq $0,%%rdx \n");
                    fprintf(fasm, "\tmovq %%%s, %%rax\n",regStk[top-2]);
                    fprintf(fasm, "\tidivq %%%s\n", regStk[top-1]);
                    fprintf(fasm, "\tmovq %%rdx, %%%s\n", regStk[top-2]);
                    top--;
                } 
	  }
    break;

  case 51:
#line 457 "simple.y"
    {
		  // Add string to string table.
		  // String table will be produced later
		  string_table[nstrings]=(yyvsp[(1) - (1)].string_val);
		  fprintf(fasm, "\t#top=%d\n", top);
		  fprintf(fasm, "\n\t# push string %s top=%d\n",
			  (yyvsp[(1) - (1)].string_val), top);
		  if (top<=nregStk) {
		  	fprintf(fasm, "\tmovq $string%d, %%%s\n", 
				nstrings, regStk[top]);
			//fprintf(fasm, "\tmovq $%s,%%%s\n", 
				//$<string_val>1, regStk[top]);
			top++;
		  }
		  nstrings++;
	  }
    break;

  case 53:
#line 474 "simple.y"
    {
  		// Lookup local var
		 int i;
 	         char * id = (yyvsp[(1) - (1)].string_val);
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
    break;

  case 54:
#line 491 "simple.y"
    {
	  		fprintf(fasm, "# Array Value\n");
	  		char * id = (yyvsp[(1) - (4)].string_val);
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
    break;

  case 55:
#line 523 "simple.y"
    {
	  		int i;
 	        char * id = (yyvsp[(2) - (2)].string_val);
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
    break;

  case 56:
#line 540 "simple.y"
    {
		  fprintf(fasm, "\n\t# push %s\n", (yyvsp[(1) - (1)].string_val));
		  if (top<=nregStk) {
			fprintf(fasm, "\tmovq $%s,%%%s\n", 
				(yyvsp[(1) - (1)].string_val), regStk[top]);
			top++;
		  }
	  }
    break;

  case 58:
#line 552 "simple.y"
    {
	 	tempNLocal[countTempNLocal] = nlocals;
	 	countTempNLocal++;
	 }
    break;

  case 59:
#line 555 "simple.y"
    {
	 	nlocals = tempNLocal[countTempNLocal - 1];
	 	countTempNLocal--;
	 }
    break;

  case 63:
#line 569 "simple.y"
    {
	addLocalVar((yyvsp[(1) - (1)].string_val), current_type);
        }
    break;

  case 64:
#line 572 "simple.y"
    {
		addLocalVar((yyvsp[(3) - (3)].string_val), current_type);
	}
    break;

  case 65:
#line 578 "simple.y"
    {
         fprintf(fasm, "################# top = 0 ############\n");
         top = 0;}
    break;

  case 66:
#line 581 "simple.y"
    {
	 	top = 0; /////////////////////top--?
	 	fprintf(fasm, "################# top = 0 ############\n");
	 	//top--;
	 }
    break;

  case 69:
#line 588 "simple.y"
    {
	 		(yyvsp[(1) - (1)].my_nlabel) = nlabel;
	 		//block 1
	 		nlabel++;
	 		fprintf(fasm, "\t#start the if statement\n");
	 		fprintf(fasm, "if_statement_%d:\n", (yyvsp[(1) - (1)].my_nlabel));
	 }
    break;

  case 70:
#line 594 "simple.y"
    {
	 		//block 2
	 		fprintf(fasm, "\tcmpq $0, %%%s\n", regStk[top-1]);
	 		fprintf(fasm, "\tje if_else_%d\n", (yyvsp[(1) - (5)].my_nlabel));
	 }
    break;

  case 71:
#line 598 "simple.y"
    {
	 		fprintf(fasm, "\tjmp if_end_%d\n", (yyvsp[(1) - (7)].my_nlabel));
	 		fprintf(fasm, "if_else_%d:\n", (yyvsp[(1) - (7)].my_nlabel));
	 }
    break;

  case 72:
#line 601 "simple.y"
    {
	 		fprintf(fasm, "if_end_%d:\n", (yyvsp[(1) - (9)].my_nlabel));
	 }
    break;

  case 73:
#line 604 "simple.y"
    {
		// act 1
		latestWhileN = nlabel;
		LoopTypeFlag = 1;	//1 for while; 2 for do while; 3 for for loop
		(yyvsp[(1) - (2)].my_nlabel)=nlabel;
		nlabel++;
		fprintf(fasm, "while_start_%d:\n", (yyvsp[(1) - (2)].my_nlabel));
         }
    break;

  case 74:
#line 612 "simple.y"
    {
		// act2
		fprintf(fasm, "\tcmpq $0, %%rbx\n");
		fprintf(fasm, "\tje while_end_%d\n", (yyvsp[(1) - (5)].my_nlabel));
		top--;
         }
    break;

  case 75:
#line 618 "simple.y"
    {
		// act3
		fprintf(fasm, "\tjmp while_start_%d\n", (yyvsp[(1) - (7)].my_nlabel));
		fprintf(fasm, "while_end_%d:\n", (yyvsp[(1) - (7)].my_nlabel));
	 }
    break;

  case 76:
#line 623 "simple.y"
    {
	 		//block 1
	 		latestDoWhileN = nlabel;
	 		LoopTypeFlag = 2;	//1 for while; 2 for do while; 3 for for loop
	 		(yyvsp[(1) - (1)].my_nlabel) = nlabel;
	 		nlabel++;
	 		fprintf(fasm, "\t#start the Do While statement\n");
	 		fprintf(fasm, "do_statement_%d:\n", (yyvsp[(1) - (1)].my_nlabel));
	 		
	 }
    break;

  case 77:
#line 632 "simple.y"
    {
	 		fprintf(fasm, "do_update_%d:\n", (yyvsp[(1) - (3)].my_nlabel));
	 }
    break;

  case 78:
#line 634 "simple.y"
    {
	 		
	 		fprintf(fasm, "\tcmpq $1, %%%s\n", regStk[top-1]);
	 		fprintf(fasm, "\tje do_statement_%d\n", (yyvsp[(1) - (8)].my_nlabel));
	 		
	 		fprintf(fasm, "do_endAll_%d:\n", (yyvsp[(1) - (8)].my_nlabel));
	 }
    break;

  case 80:
#line 641 "simple.y"
    {
	 		//block 1
	 		latestForN = nlabel;
	 		LoopTypeFlag = 3;	//1 for while; 2 for do while; 3 for for loop
	 		fprintf(fasm, "\t#start the For statement\n");
	 		(yyvsp[(1) - (1)].my_nlabel) = nlabel;
	 		nlabel++;
	 		//top = 0;
	 }
    break;

  case 81:
#line 649 "simple.y"
    {
	 		//block 2
	 		fprintf(fasm, "for_evaluation_%d:\n", (yyvsp[(1) - (5)].my_nlabel));
	 }
    break;

  case 82:
#line 652 "simple.y"
    {
	 		//block 3	
	 		fprintf(fasm, "\tcmpq $0, %%%s\n", regStk[top-1]);
	 		fprintf(fasm, "\tjne for_statement_%d\n", (yyvsp[(1) - (8)].my_nlabel));
	 		fprintf(fasm, "\tjmp for_endAll_%d\n", (yyvsp[(1) - (8)].my_nlabel));
	 		fprintf(fasm, "for_update_%d:\n", (yyvsp[(1) - (8)].my_nlabel));
	 }
    break;

  case 83:
#line 659 "simple.y"
    {
	   		fprintf(fasm, "\tjmp for_evaluation_%d\n", (yyvsp[(1) - (10)].my_nlabel));
	   		fprintf(fasm, "for_statement_%d:\n", (yyvsp[(1) - (10)].my_nlabel));
	   }
    break;

  case 84:
#line 662 "simple.y"
    {
	   		//end blocks
	   		fprintf(fasm, "\tjmp for_update_%d\n", (yyvsp[(1) - (13)].my_nlabel));
	   		fprintf(fasm, "for_endAll_%d:\n", (yyvsp[(1) - (13)].my_nlabel));
	   }
    break;

  case 88:
#line 676 "simple.y"
    {
     	fprintf(fasm, "###################handling break############################\n");
	 	if(latestWhileN > latestForN && latestWhileN > latestDoWhileN){
	 		fprintf(fasm, "\tjmp while_start_%d\n", latestWhileN);
	 	}else if(latestDoWhileN > latestWhileN && latestDoWhileN > latestForN){
	 		fprintf(fasm, "\tjmp do_update_%d\n", latestDoWhileN);
	 	}else if(latestForN > latestWhileN && latestForN > latestDoWhileN){
	 		fprintf(fasm, "\tjmp for_update_%d\n", latestForN);
	 	}    
     }
    break;

  case 89:
#line 686 "simple.y"
    {
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
    break;

  case 90:
#line 697 "simple.y"
    {
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
    break;


/* Line 1267 of yacc.c.  */
#line 2386 "y.tab.c"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;


  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yymsg);
	  }
	else
	  {
	    yyerror (YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse look-ahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse look-ahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#ifndef yyoverflow
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEOF && yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}


#line 714 "simple.y"


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



