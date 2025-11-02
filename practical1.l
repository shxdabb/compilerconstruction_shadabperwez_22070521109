%{
#include <stdio.h>
%}
%%
zero|ZERO|Zero    { printf("0\n"); }
one|ONE|One       { printf("1\n"); }
two|TWO|Two       { printf("2\n"); }
three|THREE|Three { printf("3\n"); }
four|FOUR|Four    { printf("4\n"); }
five|FIVE|Five    { printf("5\n"); }
six|SIX|Six       { printf("6\n"); }
seven|SEVEN|Seven { printf("7\n"); }
eight|EIGHT|Eight { printf("8\n"); }
nine|NINE|Nine    { printf("9\n"); }
.|\n              { /* ignore other characters */ }
%%

int main() {
    yylex();
    return 0;
}
