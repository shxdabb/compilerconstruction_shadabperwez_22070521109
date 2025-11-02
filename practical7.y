%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token NUMBER PLUS MULT MINUS DIVIDE

%%

line:
    expr '\n'       { printf("Result: %d\n", $1); }
  | '\n'
  ;

expr:
    NUMBER              { $$ = $1; }
  | expr expr PLUS      { $$ = $1 + $2; }
  | expr expr MULT      { $$ = $1 * $2; }
  | expr expr MINUS     { $$ = $1 - $2; }
  | expr expr DIVIDE    { 
                            if ($2 == 0) {
                                yyerror("Division by zero");
                                $$ = 0;
                            } else {
                                $$ = $1 / $2;
                            }
                         }
  ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter a postfix expression:\n");
    yyparse();
    return 0;
}