%{
#include "y.tab.h"
#include <stdlib.h>
%}

%%

[0-9]+              { yylval = atoi(yytext); return NUMBER; }
[ \t]+              ;                 /* ignore whitespace */
"+"                 return PLUS;
"-"                 return MINUS;
"*"                 return MULT;
"/"                 return DIVIDE;
"("                 return '(';
")"                 return ')';
"\n"                return EOL;
.                   return yytext[0]; /* catch all invalid chars */

%%

int yywrap() {
    return 1;
}
