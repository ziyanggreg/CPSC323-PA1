/* DECLARATION SECTION*/
%{

%}

/* DEFINITIONS SECTION*/
KEYWORD     [a-zA-z]{3}[a-zA-z]*
SEPARATOR   [(|)|{|}]
IDENTIFIER  [a-z]
OPERATOR    [=|<|>|-|+][=]*
INTEGER     [0-9]*
REAL        [0-9]*[.][0-9]*
PUNCTUATION [;]

%%
/* RULES SECTION*/
{KEYWORD}             {printf("keyword \t '%s' \n", yytext);}
{SEPARATOR}           {printf("separator \t '%s' \n", yytext);}
{IDENTIFIER}          {printf("identifier \t '%s' \n", yytext);}
{OPERATOR}            {printf("operator \t '%s' \n", yytext);}
{INTEGER}             {printf("integer \t '%s' \n", yytext);}
{REAL}                {printf("real \t\t '%s' \n", yytext);}
{PUNCTUATION}         {printf("punctuation \t '%s' \n", yytext);}

[ \t\n]+              //Leave out whitespaces, tabs, and newlines
[<|>][<|>]            //Leave out >> or <<
[//][a-zA-Z0-9_! ]*   //Leave out comments
["][a-zA-Z0-9_! ]*    //Leave out string literals
%%

/* USER ROUTINES SECTION */
int yywrap(){
  return 1;
} // Wraps the rule section

int main(){
  yyin = fopen("input_sourcecode.txt","r+");
  printf("TOKENS \t \t LEXEMES \n");
  printf("---------------------------\n");
  yylex();

  return 0;
}
