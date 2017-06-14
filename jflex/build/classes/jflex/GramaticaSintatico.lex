package jflex;

import java_cup.runtime.Symbol;
%%
%cup
%class AnalisadorSintatico
%type java_cup.runtime.Symbol
%line
%column

DIGIT       = [0-9]
EXPOENTE    = \" 
NUMERO_REAL = [\+\-]? {DIGIT}+ \, {DIGIT}+ 
INTEIRO     = [\+\-]? {DIGIT}+
LETTER      = [a-zA-Z_]
WHITE       = [ \t\r\n]
ATRIBUICAO  = "<-"
OP_REL = ">" | "<" | "!=" | "==" | "<=" | ">="
OP_AR = "+" | "*" | "-" | "/"
OP_LOG = "and" | "or" | "xor" | "not"
COMENTARIO = "<*" | "*>"
COMMA = ","
FINAL_LINHA = ";"
DECISAO = "if"
REPETICAO = "each"
START_PROGRAM = "start["
END_PROGRAM = "]end"
PARAMETERS = ":"
LEFT_BRACKET = "{"
RIGHT_BRACKET = "}"

%{
public String lexeme;
%}
%%
<YYINITIAL>{
{WHITE} {/*Ignore*/}
{START_PROGRAM} {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return new Symbol(Sym.START_PROGRAM );}
{END_PROGRAM} {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return new Symbol(Sym.END_PROGRAM);}
{PARAMETERS} {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return new Symbol(Sym.PARAMETERS);}
{LEFT_BRACKET} {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return new Symbol(Sym.LEFT_BRACKET);}
{RIGHT_BRACKET} {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return new Symbol(Sym.RIGHT_BRACKET);}
{OP_REL} {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return new Symbol(Sym.OP_RELACIONAL);}
{OP_LOG} {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return new Symbol(Sym.OP_LOGICO);}
{OP_AR} {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return new Symbol(Sym.OP_ARITMETICO);}
{ATRIBUICAO} {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return new Symbol(Sym.ASSIGNMENT);}
{FINAL_LINHA} {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return new Symbol(Sym.ENDING_LINE);}
{COMMA} {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return new Symbol(Sym.COMMA);}
{COMENTARIO} {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return new Symbol(Sym.COMMENT);}
{DECISAO} {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return new Symbol(Sym.SELECTION);}
{REPETICAO} {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return new Symbol(Sym.REPETITION);}
{NUMERO_REAL} {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return new Symbol(Sym.NUM_REAL);}
\@{LETTER}+ {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return new Symbol(Sym.ID);} 
\&{LETTER}+ {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return new Symbol(Sym.FUNCTION);}
\|{LETTER}+\| {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return new Symbol(Sym.STRINGS);}
{INTEIRO} {lexeme=yytext()+ "\nLinha: " +yyline+"\nColuna: "+yycolumn; return new Symbol(Sym.INT);}
{EXPOENTE} {lexeme=yytext()+"\nLinha: " +yyline+"\nColuna: "+yycolumn; return new Symbol(Sym.EXPOENT);}
}
<<EOF>> {return new Symbol(Sym.EOF);}
//[^]{throw new Error("Caractere invalido: "+yytext()+" na linha "+(yyline+1)+", coluna "+(yycolumn+1));}


