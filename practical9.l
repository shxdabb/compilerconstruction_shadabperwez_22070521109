%{
#include "y.tab.h"
%}

%%

"for"                   return FOR;
"("                     return LPAREN;
")"                     return RPAREN;
";"                     return SEMICOLON;
"{"                     return LBRACE;
"}"                     return RBRACE;
"++"                    return INC;
"--"                    return DEC;
"<="                    return LE;
">="                    return GE;
"=="                    return EQ;
"!="                    return NE;
"<"                     return LT;
">"                     return GT;
"="                     return ASSIGN;
"+"                     return PLUS;
"-"                     return MINUS;
"*"                     return MULT;
"/"                     return DIV;

[a-zA-Z_][a-zA-Z0-9_]*  return ID;
[0-9]+                  { yylval.num = atoi(yytext); return NUMBER; }

[ \t\n]+                ;    /* ignore whitespace */
.                       return yytext[0];

%%

int yywrap() { return 1; }
