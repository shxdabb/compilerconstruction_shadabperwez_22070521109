%{
#include <stdio.h>
%}

%%

[0-9]+  {
            int decimal_value = 0;
            char hex_string[100]; // Buffer to store the hexadecimal digits
            int i = 0;

    
            for (int k = 0; yytext[k] != '\0'; k++) {
                decimal_value = decimal_value * 10 + (yytext[k] - '0');
            }

            if (decimal_value == 0) {
                printf("0x0");
            } else {
                while (decimal_value > 0) {
                    int remainder = decimal_value % 16;
                    if (remainder < 10) {
                        hex_string[i] = remainder + '0';
                    } else {
                        hex_string[i] = remainder - 10 + 'A';
                    }
                    decimal_value = decimal_value / 16;
                    i++;
                }

                printf("0x");
                for (int j = i - 1; j >= 0; j--) {
                    printf("%c", hex_string[j]);
                }
            }
        }

.|\n    {
            printf("%s", yytext); 
        }

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
