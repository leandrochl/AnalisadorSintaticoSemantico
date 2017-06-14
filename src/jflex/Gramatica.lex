package jflex;
import static jflex.Token.*;
%%
%class AnalisadorLexico
%type Token
%line
%column

ZERO        = 0
DIGIT       = [0-9]
EXPOENTE    = \" 
NUMERO_REAL = [\+\-]? {DIGIT}+ \, {DIGIT}+ 
INTEIRO     = [\+\-]? {DIGIT}+
LETTER      = [a-zA-Z_]
WHITE       = [ \t\r\n]
SPACE       = [\ \t\r\n]

ATRIBUICAO  = "<-"
OP_REL      = ">" | "<" | "!=" | "==" | "<=" | ">="
OP_AR       = "+" | "*" | "-" | "/"
OP_LOG      = "and" | "or" | "xor" | "not"
COMENTARIO  = "<*" | "*>"
BLOCO       = "{" | "}"
FLOAT       = ","
PARAMETERS  = ":"
FINAL_LINHA = ";"
DECISAO     = "if"
REPETICAO   = "each"


%{
public String lexeme;
%}
%%
{WHITE} {/*Ignore*/}
{OP_REL} {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return OP_RELACIONAL;}
{PARAMETERS} {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return PARAMETERS;}
{OP_LOG} {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return OP_LOGICO;}
{OP_AR} {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return OP_ARITMETICO;}
{ATRIBUICAO} {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return ASSIGNMENT;}
{FINAL_LINHA} {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return ENDING_LINE;}
{FLOAT} {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return FLOAT_SIGN;}
{COMENTARIO} {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return COMMENT;}
{BLOCO} {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return BLOCK;}
{DECISAO} {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return SELECTION;}
{REPETICAO} {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return REPETITION;}
{NUMERO_REAL} {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return NUM_REAL;}
\@{LETTER}+ {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return ID;} 
\&{LETTER}+ {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return FUNCTION;}
\|{LETTER}+\| {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return STRING;}
{INTEIRO} {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return INT;}
{EXPOENTE} {lexeme=yytext()+"\nLinha: " +yyline+"\nColuna: "+yycolumn; return EXPOENT;}
. {lexeme=yytext()+"\nLinha: " +yyline+"\nColuna: "+yycolumn; return ERROR;}


