

#include <stdio.h>
#include <stdlib.h>



#include "tokens.h"
#include "lex.yy.c"



int main( int argc, char **argv )
{
    int token;
    ++argv, --argc;  /* skip over program name */
    if ( argc > 0 )
        yyin = fopen( argv[0], "r" );
    else
        yyin = stdin;

    token = yylex();
    while(token != 0)
    {
        
        if(token==T_OPERATOR){
            printf("::operador = %s\n", yytext);
        }

        if(token==T_PROCEDURE){
            printf("::procedimento = %s\n", yytext);
        }

        if(token == T_INTEGER){
            printf("::inteiro = %d\n", atoi(yytext));
        }
        if(token==T_ID){
            printf(":: ID = %s\n", yytext);
        }
        
        if(token==T_OTHERS){
            printf("::outro = %s\n", yytext);
        }
        printf("\n");
        token = yylex();
    }
}



