%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
int yylex(void);
%}

%union {
    int ival;
    float fval;
    char *sval;
}

%token <ival> INTEGER
%token <fval> FLOAT
%token <sval> IDENTIFIER
%token INT RETURN IF ELSE WHILE FOR
%token PLUS MINUS MUL DIV ASSIGN EQ NE LT LE GT GE
%token SEMICOLON COMMA LPAREN RPAREN LBRACE RBRACE

%%
program:
    function
    ;

function:
    INT IDENTIFIER LPAREN RPAREN LBRACE statements RBRACE
    ;

statements:
    statement
    | statements statement
    ;

statement:
    declaration
    | assignment
    | return_statement
    | if_statement
    | while_statement
    ;

declaration:
    INT IDENTIFIER SEMICOLON
    ;

assignment:
    IDENTIFIER ASSIGN expression SEMICOLON
    ;

expression:
    INTEGER
    | IDENTIFIER
    | expression PLUS expression
    | expression MINUS expression
    | expression MUL expression
    | expression DIV expression
    | LPAREN expression RPAREN
    ;
%%
