%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int tempCount = 0;

char* newTemp() {
    char buf[10];
    sprintf(buf, "t%d", tempCount++);
    return strdup(buf);
}

void yyerror(const char *s);
int yylex(void);
%}

%union {
    char *sval;
}

%token <sval> ID NUMBER
%token PLUS MINUS MULT DIV LPAREN RPAREN
%type <sval> expr

%left PLUS MINUS
%left MULT DIV

%%

stmt:
      expr '\n'   { printf("Final Result in %s\n", $1); }
    ;

expr:
      expr PLUS expr   { char *t = newTemp(); printf("%s = %s + %s\n", t, $1, $3); $$ = t; }
    | expr MINUS expr  { char *t = newTemp(); printf("%s = %s - %s\n", t, $1, $3); $$ = t; }
    | expr MULT expr   { char *t = newTemp(); printf("%s = %s * %s\n", t, $1, $3); $$ = t; }
    | expr DIV expr    { char *t = newTemp(); printf("%s = %s / %s\n", t, $1, $3); $$ = t; }
    | LPAREN expr RPAREN { $$ = $2; }
    | ID               { $$ = $1; }
    | NUMBER           { $$ = $1; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter an arithmetic expression:\n");
    yyparse();
    return 0;
}
