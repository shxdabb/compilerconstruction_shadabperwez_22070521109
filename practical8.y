%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token NUMBER PLUS MINUS MULT DIVIDE EOL
%left PLUS MINUS
%left MULT DIVIDE

%%

lines:
      lines expr EOL        { printf("= %d\n", $2); }
    | lines error EOL       { yyerror("Invalid expression, skipping..."); yyerrok; }
    | /* empty */
    ;

expr:
      NUMBER
    | expr PLUS expr        { $$ = $1 + $3; }
    | expr MINUS expr       { $$ = $1 - $3; }
    | expr MULT expr        { $$ = $1 * $3; }
    | expr DIVIDE expr      { 
                                if ($3 == 0) {
                                    yyerror("Division by zero");
                                    $$ = 0;
                                } else {
                                    $$ = $1 / $3;
                                }
                             }
    | '(' expr ')'          { $$ = $2; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Desk Calculator (Ctrl+C to quit)\n");
    yyparse();
    return 0;
}
