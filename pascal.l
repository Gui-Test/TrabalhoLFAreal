/* scanner for a toy Pascal-like language */
     
%{
/* need this for the call to atof() below */
#include <math.h>
%}
     
DIGIT    [0-9]
ID       [a-z][a-z0-9]*
 
%option noyywrap 
%%
     
{DIGIT}+    {
                 printf( "An integer: %s (%d)\n", yytext,
                         atoi( yytext ) );
						 return T_INTEGER;
                 }
     
{DIGIT}+"."{DIGIT}*        {
                 printf( "A float: %s (%g)\n", yytext,
                         atof( yytext ) );
						 return T_OTHERS;
                 }
     

if|then|begin|end|procedure|function|while|do|Result        {
                 printf( "A keyword: %s\n", yytext );
				 return T_OTHERS;
                 }

coisa|;   {printf( "Uma coisa: %s\n", yytext ); return T_Alguma_Coisa;}
     
{ID}       { printf( "An identifier: %s\n", yytext ); return T_ID;}
     
"+"|"-"|"*"|"/"   {printf( "An operator: %s\n", yytext ); return T_OPERATOR;}
     
"{"[^}\n]*"}"     /* eat up one-line comments */
     
[ \t\n]+          /* eat up whitespace */
     
.           {printf( "Unrecognized character: %s\n", yytext ); return T_OTHERS;}
 

 
%%
     
     
		
		 