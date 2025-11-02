%{
#include <stdio.h>
%}

%%

.*com$    { printf("Line ends with 'com' : %s", yytext); }
.*        { printf("Line does not end with 'com' : %s", yytext); }

%%

int main() {
    yylex();
    return 0;
}
