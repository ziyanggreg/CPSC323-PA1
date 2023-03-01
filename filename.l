/*AUTHOR: Greg Zhang */
/*AUTHOR EMAIL: ziyangz@csu.fullerton.edu */
/*** Description: CPSC-323 Programming Assignment 1.
      This is a flex program that will take input from the "input_sourcecode.txt" file and sort
      lexemes to their corresponding token categories. The result is displayed in a table. ***/

/*** DECLARATION SECTION ***/
%{

%}

/*** DEFINITIONS SECTION ***/
%option noyywrap

KEYWORD     [a-zA-z]{3}[a-zA-z]*
SEPARATOR   [(){}|]
IDENTIFIER  [a-zA-Z]
OPERATOR    (?:=|<|>|[-+])=*
INTEGER     [0-9]+
REAL        [0-9]*[.][0-9]*
PUNCTUATION [;,.]

/*** RULES SECTION ***/
%option nounput nodefault
%{
    char keyword_lexeme[100];
    char separator_lexeme[100];
    char identifier_lexeme[100];
    char operator_lexeme[100];
    char integer_lexeme[100];
    char real_lexeme[100];
    char punc_lexeme[100];

%}

%%
{KEYWORD}             {
                        if(strlen(keyword_lexeme) == 0) {
                          strcpy(keyword_lexeme, yytext);
                        } else {
                            strcat(keyword_lexeme, " ");
                            strcat(keyword_lexeme, yytext);
                          }
                      }
{SEPARATOR}           {
                        if(strlen(separator_lexeme) == 0) {
                          strcpy(separator_lexeme, yytext);
                        } else {
                            strcat(separator_lexeme, " ");
                            strcat(separator_lexeme, yytext);
                          }
                      }
{IDENTIFIER}          {
                        if(strlen(identifier_lexeme) == 0) {
                          strcpy(identifier_lexeme, yytext);
                        } else {
                            strcat(identifier_lexeme, " ");
                            strcat(identifier_lexeme, yytext);
                          }
                      }
{OPERATOR}            {
                        if(strlen(operator_lexeme) == 0) {
                          strcpy(operator_lexeme, yytext);
                        } else {
                            strcat(operator_lexeme, " ");
                            strcat(operator_lexeme, yytext);
                          }
                      }
{INTEGER}             {
                        if(strlen(integer_lexeme) == 0) {
                          strcpy(integer_lexeme, yytext);
                        } else {
                            strcat(integer_lexeme, " ");
                            strcat(integer_lexeme, yytext);
                          }
                      }
{REAL}                {
                        if(strlen(real_lexeme) == 0) {
                          strcpy(real_lexeme, yytext);
                        } else {
                            strcat(real_lexeme, " ");
                            strcat(real_lexeme, yytext);
                          }
                      }
{PUNCTUATION}         {
                        if(strlen(punc_lexeme) == 0) {
                          strcpy(punc_lexeme, yytext);
                        } else {
                            strcat(punc_lexeme, " ");
                            strcat(punc_lexeme, yytext);
                          }
                      }

[ \t\n]+              //Leave out whitespaces, tabs, and newlines
[<|>][<|>]            //Leave out >> or <<
[//][a-zA-Z0-9_! ]*   //Leave out comments
\"(\\.|[^"\\])*\"    //Leave out string literals
.                     //Leave out unrecognized characters

%%

/*** USER ROUTINES SECTION ***/
int main(){
  yyin = fopen("input_sourcecode.txt","r");
  printf("TOKENS \t \t LEXEMES \n");
  printf("---------------------------\n");
  while(yylex()) {
      if(strcmp(yytext, "") != 0) { // check if yytext is not empty
          if(strcmp(keyword_lexeme, "") != 0 && strcmp(yytext, keyword_lexeme) != 0) {
              printf("keyword \t '%s' \n", keyword_lexeme);
              memset(keyword_lexeme, 0, sizeof(keyword_lexeme)); // reset keyword_lexeme
          }
          if(strcmp(keyword_lexeme, "") == 0) {
              strcpy(keyword_lexeme, yytext);
          } else {
              strcat(keyword_lexeme, " ");
              strcat(keyword_lexeme, yytext);
          }
          if(strcmp(separator_lexeme, "") != 0 && strcmp(yytext, separator_lexeme) != 0) {
              printf("separator \t '%s' \n", separator_lexeme);
              memset(separator_lexeme, 0, sizeof(separator_lexeme)); // reset separator_lexeme
          }
          if(strcmp(separator_lexeme, "") == 0) {
              strcpy(separator_lexeme, yytext);
          } else {
              strcat(keyword_lexeme, " ");
              strcat(keyword_lexeme, yytext);
          }
          if(strcmp(identifier_lexeme, "") != 0 && strcmp(yytext, identifier_lexeme) != 0) {
              printf("keyword \t '%s' \n", identifier_lexeme);
              memset(identifier_lexeme, 0, sizeof(identifier_lexeme)); // reset identifier_lexeme
          }
          if(strcmp(identifier_lexeme, "") == 0) {
              strcpy(identifier_lexeme, yytext);
          } else {
              strcat(identifier_lexeme, " ");
              strcat(identifier_lexeme, yytext);
          }
          if(strcmp(operator_lexeme, "") != 0 && strcmp(yytext, operator_lexeme) != 0) {
              printf("operator \t '%s' \n", operator_lexeme);
              memset(operator_lexeme, 0, sizeof(operator_lexeme)); // reset operator_lexeme
          }
          if(strcmp(operator_lexeme, "") == 0) {
              strcpy(operator_lexeme, yytext);
          } else {
              strcat(operator_lexeme, " ");
              strcat(operator_lexeme, yytext);
          }
          if(strcmp(integer_lexeme, "") != 0 && strcmp(yytext, integer_lexeme) != 0) {
              printf("integer \t '%s' \n", integer_lexeme);
              memset(integer_lexeme, 0, sizeof(integer_lexeme)); // reset integer_lexeme
          }
          if(strcmp(integer_lexeme, "") == 0) {
              strcpy(integer_lexeme, yytext);
          } else {
              strcat(integer_lexeme, " ");
              strcat(integer_lexeme, yytext);
          }
          if(strcmp(real_lexeme, "") != 0 && strcmp(yytext, real_lexeme) != 0) {
              printf("real \t '%s' \n", real_lexeme);
              memset(real_lexeme, 0, sizeof(real_lexeme)); // reset real_lexeme
          }
          if(strcmp(real_lexeme, "") == 0) {
              strcpy(real_lexeme, yytext);
          } else {
              strcat(real_lexeme, " ");
              strcat(real_lexeme, yytext);
          }
          if(strcmp(punc_lexeme, "") != 0 && strcmp(yytext, punc_lexeme) != 0) {
              printf("punc \t '%s' \n", punc_lexeme);
              memset(punc_lexeme, 0, sizeof(punc_lexeme)); // reset punc_lexeme
          }
          if(strcmp(punc_lexeme, "") == 0) {
              strcpy(punc_lexeme, yytext);
          } else {
              strcat(punc_lexeme, " ");
              strcat(punc_lexeme, yytext);
          }
      }
  }
  if(strcmp(keyword_lexeme, "") != 0) {
      printf("keyword \t '%s' \n", keyword_lexeme);
  }
  if(strcmp(separator_lexeme, "") != 0) {
      printf("separator \t '%s' \n", separator_lexeme);
  }
  if(strcmp(identifier_lexeme, "") != 0) {
      printf("identifier \t '%s' \n", identifier_lexeme);
  }
  if(strcmp(operator_lexeme, "") != 0) {
      printf("operator \t '%s' \n", operator_lexeme);
  }
  if(strcmp(integer_lexeme, "") != 0) {
      printf("integer \t '%s' \n", integer_lexeme);
  }
  if(strcmp(real_lexeme, "") != 0) {
      printf("real \t '%s' \n", real_lexeme);
  }
  if(strcmp(punc_lexeme, "") != 0) {
      printf("punctuation \t '%s' \n", punc_lexeme);
  }

  return 0;
}
