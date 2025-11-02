%{
#include <stdio.h>
int count = 0;
%}
%%
[aA][a-zA-Z]* { count++; }
.|\n         { }
%%
int main() {
    printf("Enter an sentence (Ctrl + D to stop):\n");
    yylex();
    printf("Number of words starting with 'A' or 'a' are: %d\n", count);
    return 0;
}
 