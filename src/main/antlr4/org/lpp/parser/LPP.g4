/** Gramatica del Lenguaje LPP en ENBNF para ser procesado por ANTLR4 */
grammar LPP;

programa
    : NL? declaracionesTipos declaracionesVariables declaracionesSubprogramas sentenciaCompuesta EOF
    ;

declaracionesTipos
    : ( declaracionRegistro | declaracionTipoArchivo )*
    ;

declaracionRegistro
    : REGISTRO ID NL declaracionesVariables FIN REGISTRO NL
    ;

declaracionTipoArchivo
    : TIPO ID ES ARCHIVO SECUENCIAL NL
    ;

declaracionesSubprogramas
    : ( declaracionProcedimiento | declaracionFuncion )*
    ;

declaracionProcedimiento
    : PROCEDIMIENTO ID ( '(' argumentos ')' )? NL declaracionesVariables sentenciaCompuesta
    ;

declaracionFuncion
    : FUNCION ID ( '(' argumentos ')' )? ':' tipo NL declaracionesVariables sentenciaCompuesta
    ;

argumentos
    : argumento ( ',' argumento )*
    ;

argumento
    : VAR? tipo ID
    ;

declaracionesVariables
    : declaracionVariables*
    ;

declaracionVariables
    : tipo listaIDs NL
    ;

tipo
    : ENTERO
    | REAL
    | BOOLEANO
    | CARACTER
    | CADENA ( '[' LITERAL_ENTERO ']')?
    | ARREGLO '[' listaEnteros ']' DE tipo
    | ID
    ;

listaIDs
    : ID ( ',' ID )*
    ;

listaEnteros
    : LITERAL_ENTERO ( ',' LITERAL_ENTERO )*
    ;

sentenciaCompuesta
    : INICIO NL sentencias FIN NL
    ;

sentencias
    : sentencia*
    ;

sentencia
    : escriba
    | lea
    | asignar
    | llamar
    | si
    | caso
    | mientras
    | para
    | repita
    | retorne
    | abrir
    | cerrar
    | escribir
    | leer
    ;

escriba
    : ESCRIBA listaExpr NL
    ;

lea
    : LEA listaExpr NL
    ;

asignar
    : expr '<-' expr NL
    ;

llamar
    : LLAMAR ( PROC_NUEVA_LINEA | PROC_LIMPIAR_PANTALLA ) NL
    | LLAMAR ID ( '(' listaExpr ')' )? NL
    ;

si
    : SI expr ENTONCES NL sentencias sino? FIN SI NL
    ;

sino
    : SINO si
    | SINO NL sentencias
    ;

caso
    : CASO expr NL casoValores+ casoSino? FIN CASO NL
    ;

casoValores
    : listaExpr ':' NL sentencias
    ;

casoSino
    : SINO ':' NL sentencias
    ;

mientras
    : MIENTRAS expr HAGA NL sentencias FIN MIENTRAS NL
    ;

para
    : PARA expr '<-' expr HASTA expr HAGA NL sentencias FIN PARA NL
    ;

repita
    : REPITA NL sentencias HASTA expr NL
    ;

retorne
    : RETORNE expr NL
    ;

abrir
    : ABRIR expr COMO ID PARA ( ESCRITURA | LECTURA ) NL
    ;

cerrar
    : CERRAR ID NL
    ;

escribir
    : ESCRIBIR listaExpr NL
    ;

leer
    : LEER listaExpr NL
    ;

listaExpr
    : expr ( ',' expr )*
    ;

expr
    : '(' expr ')'
    | literal
    | ID
    | expr '.' ID
    | expr '[' listaExpr ']'
    | FUNC_FDA '(' expr ')'
    | ID '(' listaExpr? ')'
    | '-' expr
    | NO expr
    | expr '^' expr
    | expr ( '*' | '/' | DIV_ENTEROS | MOD ) expr
    | expr ( '+' | '-' ) expr
    | expr ( '=' | '<>' | '<=' | '>=' | '<' | '>' ) expr
    | expr Y expr
    | expr O expr
    ;

literal
    : LITERAL_REAL
    | LITERAL_ENTERO
    | LITERAL_CADENA
    | LITERAL_CARACTER
    | ( VERDADERO | FALSO )
    ;

// REGLAS LEXICAS
INICIO : 'INICIO' | 'Inicio' | 'inicio' ;
FIN : 'FIN' | 'Fin' | 'fin' ;
ESCRIBA : 'ESCRIBA' | 'Escriba' | 'escriba' ;
LEA : 'LEA' | 'Lea' | 'lea' ;
LLAMAR : 'LLAMAR' | 'Llamar' | 'llamar' ;
SI : 'SI' | 'Si' | 'si' ;
ENTONCES : 'ENTONCES' | 'Entonces' | 'entonces' ;
SINO : 'SINO' | 'Sino' | 'sino' ;
CASO : 'CASO' | 'Caso' | 'caso' ;
MIENTRAS : 'MIENTRAS' | 'Mientras' | 'mientras' ;
HAGA : 'HAGA' | 'Haga' | 'haga' ;
PARA : 'PARA' | 'Para' | 'para' ;
HASTA : 'HASTA' | 'Hasta' | 'hasta' ;
REPITA : 'REPITA' | 'Repita' | 'repita' ;
PROCEDIMIENTO : 'PROCEDIMIENTO' | 'Procedimiento' | 'procedimiento' ;
VAR : 'VAR' | 'Var' | 'var' ;
FUNCION : 'FUNCION' | 'Funcion' | 'funcion' ;
RETORNE : 'RETORNE' | 'Retorne' | 'retorne' ;

// ARCHIVOS
TIPO : 'TIPO' | 'Tipo' | 'tipo' ;
ES : 'ES' | 'Es' | 'es' ;
ARCHIVO : 'ARCHIVO' | 'Archivo' | 'archivo' ;
SECUENCIAL : 'SECUENCIAL' | 'Secuencial' | 'secuencial' ;
ABRIR : 'ABRIR' | 'Abrir' | 'abrir' ;
COMO : 'COMO' | 'Como' | 'como' ;
ESCRITURA : 'ESCRITURA' | 'Escritura' | 'escritura' ;
LECTURA : 'LECTURA' | 'Lectura' | 'lectura' ;
CERRAR : 'CERRAR' | 'Cerrar' | 'cerrar' ;
ESCRIBIR : 'ESCRIBIR' | 'Escribir' | 'escribir' ;
LEER : 'LEER' | 'Leer' | 'leer' ;

// LIBRERIA ESTANDAR ;)
PROC_NUEVA_LINEA : 'NUEVA_LINEA' | 'Nueva_Linea' | 'nueva_linea' ;
PROC_LIMPIAR_PANTALLA : 'LIMPIAR_PANTALLA' | 'Limpiar_Pantalla' | 'limpiar_pantalla' ;
FUNC_FDA : 'FDA' | 'Fda' | 'fda' ;

// TIPOS PREDEFINIDOS
ENTERO : 'ENTERO' | 'Entero' | 'entero' ;
REAL : 'REAL' | 'Real' | 'real' ;
CARACTER : 'CARACTER' | 'Caracter' | 'caracter' ;
BOOLEANO : 'BOOLEANO' | 'Booleano' | 'booleano' ;
CADENA : 'CADENA' | 'Cadena' | 'cadena' ;
REGISTRO : 'REGISTRO' | 'Registro' | 'registro' ;
ARREGLO : 'ARREGLO' | 'Arreglo' | 'arreglo' ;
DE : 'DE' | 'De' | 'de' ;

// OPERADORES
MULT : '*' ;
DIV : '/' ;
MOD : 'MOD' | 'mod' ;
DIV_ENTEROS : 'DIV' | 'div' ;
SUMA : '+' ;
RESTA : '-' ;
IGUAL : '=' ;
DESIGUAL : '<>' ;
MAYOR : '>' ;
MAYOR_IGUAL : '>=' ;
MENOR : '<' ;
MENOR_IGUAL : '<=' ;
Y : 'Y' | 'y' ;
O : 'O' | 'o' ;
NO : 'NO' | 'No' | 'no' ;

// LITERALES
LITERAL_REAL : [0-9]+ '.' [0-9]+ ;
LITERAL_ENTERO : [0-9]+ ;
LITERAL_CADENA : '"' CARACTERES_CADENA* '"' ;
fragment
CARACTERES_CADENA : ~["] | '\\"' ;
LITERAL_CARACTER : '\'' CARACTERES_CARACTER '\'' ;
fragment
CARACTERES_CARACTER : ~['] | '\\\'' ;
VERDADERO : 'VERDADERO' | 'Verdadero' | 'verdadero' ;
FALSO : 'FALSO' | 'Falso' | 'falso' ;


// IDENTIFICADOR (Debe de aparecer despues de todas las palabras reservadas en la gramatica)
ID : [a-zA-Z$_] [a-zA-Z0-9$_]* ;

// ESPACIO BLANCO (WHITESPACE) Y NUEVA LINEA
NL : [\r\n]+ ;
WS : [ \t]+ -> skip ;
