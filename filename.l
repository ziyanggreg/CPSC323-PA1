/* Definitions */
%{

%}

/* Rules (Regular Expressions) */
%%

[a-zA-z]{3}[a-zA-z]* {printf("keyword \t '%s' \n", yytext);}
[(|)|{|}] {printf("separator \t '%s' \n", yytext);}
[a-z] {printf("identifier \t '%s' \n", yytext);}
[=|<|>|-|+][=]* {printf("operator \t '%s' \n", yytext);}
[0-9]* {printf("integer \t '%s' \n", yytext);}
[0-9]*[.][0-9]* {printf("real \t\t '%s' \n", yytext);}
[;] {printf("punctuation \t '%s' \n", yytext);}

[ ]                   //Leave out spaces
\t                    //Leave out tabs
\n                    //Leave out new lines
[<|>][<|>]            //Leave out >> or <<
[//][a-zA-Z0-9_! ]*   //leave out comments
["][a-zA-Z0-9_! ]*    //Leave out string literals

%%

/* User Routines */
int yywrap(){
  return 1;
} // wraps the above rule section

int main(){
  yyin=fopen("input_sourcecode.txt","r+");
  printf("TOKENS \t \t LEXEMES \n");
  printf("---------------------------\n");
  yylex();

  return 0;
}
