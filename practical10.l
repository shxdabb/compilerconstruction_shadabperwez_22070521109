%{
#include "y.tab.h"
%}

%%

[0-9]+                  { yylval.sval = strdup(yytext); return NUMBER; }
[a-zA-Z][a-zA-Z0-9]*    { yylval.sval = strdup(yytext); return ID; }
[ \t]                   ;     /* ignore spaces and tabs */
"\n"                    return '\n';
"+"                     return PLUS;
"-"                     return MINUS;
"*"                     return MULT;
"/"                     return DIV;
"("                     return LPAREN;
")"                     return RPAREN;
.                       ;

%%

int yywrap() { return 1; }
