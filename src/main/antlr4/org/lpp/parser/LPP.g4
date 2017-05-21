/** Gramatica del Lenguaje LPP en ENBNF para ser procesado por ANTLR4 */
grammar LPP;

programa
    : NL* declaracionesTipos declaracionesVariables declaracionesSubprogramas sentenciasPrograma
    ;

declaracionesTipos
    : ( declaracionRegistro | declaracionTipo )*
    ;

declaracionRegistro
    : REGISTRO ID NL+ declaracionesVariables FIN REGISTRO NL+
    ;

declaracionTipo
    : TIPO ID ES tipo NL+
    ;

declaracionesSubprogramas
    : ( declaracionProcedimiento | declaracionFuncion )*
    ;

declaracionProcedimiento
    : PROCEDIMIENTO ID ( '(' argumentos ')' )? NL+ declaracionesVariables sentenciasSubprograma
    ;

declaracionFuncion
    : FUNCION ID ( '(' argumentos ')' )? ':' tipo NL+ declaracionesVariables sentenciasSubprograma
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
    : tipo listaIDs NL+
    ;

tipo
    : ENTERO
    | REAL
    | BOOLEANO
    | CARACTER
    | CADENA ( '[' LITERAL_ENTERO ']')?
    | ARREGLO '[' listaEnteros ']' DE tipo
    | ARCHIVO SECUENCIAL
    | ARCHIVO DE tipo
    | ID
    ;

listaIDs
    : ID ( ',' ID )*
    ;

listaEnteros
    : LITERAL_ENTERO ( ',' LITERAL_ENTERO )*
    ;

sentenciasSubprograma
    : INICIO NL+ sentencias FIN NL+
    ;

sentenciasPrograma
    : INICIO NL+ sentencias FIN NL* EOF
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
    : ESCRIBA listaExpr NL+
    ;

lea
    : LEA listaExpr NL+
    ;

asignar
    : expr '<-' expr NL+
    ;

llamar
    : LLAMAR procedimientoLibreriaEstandar ( '(' listaExpr? ')' )? NL+
    | LLAMAR funcionLibreriaEstandar ( '(' listaExpr? ')' )? NL+
    | LLAMAR ID ( '(' listaExpr? ')' )? NL+
    ;

procedimientoLibreriaEstandar
    : PROC_NUEVA_LINEA
    | PROC_LIMPIAR_PANTALLA
    | PROC_POSICIONAR_CURSOR
    | PROC_IR_A
    | PROC_IR_A_INICIO
    | PROC_IR_A_FIN
    | PROC_INICIALIZAR_ALEATORIO
    | PROC_PAUSA
    | PROC_COLOR_TEXTO
    | PROC_COLOR_FONDO
    ;

si
    : SI expr NL* ENTONCES NL+ sentencias sino? FIN SI NL+
    ;

sino
    : SINO si
    | SINO NL+ sentencias
    ;

caso
    : CASO expr NL+ casoOpciones+ casoSino? FIN CASO NL+
    ;

casoOpciones
    : listaOpciones ':' NL+ sentencias
    ;

listaOpciones
    : opcion ( ',' opcion ) *
    ;

opcion
    : rangoExpr
    | expr
    ;

rangoExpr
    : expr '->' expr
    ;

casoSino
    : SINO ':' NL* sentencias
    ;

mientras
    : MIENTRAS expr NL* HAGA NL+ sentencias FIN MIENTRAS NL+
    ;

para
    : PARA expr '<-' expr HASTA expr NL* HAGA NL+ sentencias FIN PARA NL+
    ;

repita
    : REPITA NL+ sentencias HASTA expr NL+
    ;

retorne
    : RETORNE expr NL+
    ;

abrir
    : ABRIR expr COMO ID PARA acceso NL+
    ;

acceso
    : LECTURA ( ',' ESCRITURA )?
    | ESCRITURA ( ',' LECTURA )?
    ;

cerrar
    : CERRAR ID NL+
    ;

escribir
    : ESCRIBIR listaExpr NL+
    ;

leer
    : LEER listaExpr NL+
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
    | funcionLibreriaEstandar '(' listaExpr? ')'
    | ID '(' listaExpr? ')'
    | '-' expr
    | NO expr
    | expr '^'<assoc=right> expr
    | expr ( '*' | '/' | DIV_ENTEROS | MOD ) expr
    | expr ( '+' | '-' ) expr
    | expr ( '=' | '<>' | '<=' | '>=' | '<' | '>' ) expr
    | expr OP_Y expr
    | expr OP_O expr
    ;

funcionLibreriaEstandar
    : FUNC_FDA
    | FUNC_POSICION_ACTUAL
    | FUNC_ALEATORIO
    | FUNC_OBTENER_CARACTER
    | FUNC_ENTERO_A_CADENA
    | FUNC_REAL_A_CADENA
    | FUNC_TECLA_PRESIONADA
    | FUNC_VALOR_ASCII
    | FUNC_CARACTER_ASCII
    | FUNC_LONGITUD
    ;

literal
    : LITERAL_REAL
    | LITERAL_ENTERO
    | LITERAL_CADENA
    | LITERAL_CARACTER
    | ( VERDADERO | FALSO )
    ;

// REGLAS LEXICAS
INICIO : I N I C I O ;
FIN : F I N ;
ESCRIBA : E S C R I B A ;
LEA : L E A ;
LLAMAR : L L A M A R ;
SI : S I ;
ENTONCES : E N T O N C E S ;
SINO : S I N O ;
CASO : C A S O ;
MIENTRAS : M I E N T R A S ;
HAGA : H A G A ;
PARA : P A R A ;
HASTA : H A S T A ;
REPITA : R E P I T A ;
PROCEDIMIENTO : P R O C E D I M I E N T O ;
VAR : V A R ;
FUNCION : F U N C I O N ;
RETORNE : R E T O R N E ;

// DEFINICION DE TIPOS
TIPO : T I P O ;
ES : E S ;
ARCHIVO : A R C H I V O ;
SECUENCIAL : S E C U E N C I A L ;
// TIPOS PREDEFINIDOS
ENTERO : E N T E R O ;
REAL : R E A L ;
CARACTER : C A R A C T E R ;
BOOLEANO : B O O L E A N O ;
CADENA : C A D E N A ;
REGISTRO : R E G I S T R O ;
ARREGLO : A R R E G L O ;
DE : D E ;

// ARCHIVOS
ABRIR : A B R I R ;
COMO : C O M O ;
ESCRITURA : E S C R I T U R A ;
LECTURA : L E C T U R A ;
CERRAR : C E R R A R ;
ESCRIBIR : E S C R I B I R ;
LEER : L E E R ;

// LIBRERIA ESTANDAR
PROC_NUEVA_LINEA : N U E V A '_' L I N E A ;
PROC_LIMPIAR_PANTALLA : L I M P I A R '_' P A N T A L L A ;
PROC_POSICIONAR_CURSOR : P O S I C I O N A R '_' C U R S O R ;
PROC_IR_A_INICIO : I R '_' A '_' I N I C I O ;
PROC_IR_A_FIN : I R '_' A '_' F I N ;
PROC_IR_A : I R '_' A ;
PROC_INICIALIZAR_ALEATORIO : I N I C I A L I Z A R '_' A L E A T O R I O ;
PROC_PAUSA : P A U S A ;
PROC_COLOR_TEXTO : C O L O R '_' T E X T O ;
PROC_COLOR_FONDO : C O L O R '_' F O N D O ;

FUNC_FDA : F D A ;
FUNC_POSICION_ACTUAL : P O S I C I O N '_' A C T U A L ;
FUNC_ALEATORIO : A L E A T O R I O ;
FUNC_OBTENER_CARACTER : O B T E N E R '_' C A R A C T E R ;
FUNC_ENTERO_A_CADENA : E N T E R O '_' A '_' C A D E N A ;
FUNC_REAL_A_CADENA : R E A L '_' A '_' C A D E N A ;
FUNC_TECLA_PRESIONADA : T E C L A '_' P R E S I O N A D A ;
FUNC_VALOR_ASCII : V A L O R '_' A S C I I ;
FUNC_CARACTER_ASCII : C A R A C T E R '_' A S C I I ;
FUNC_LONGITUD : L O N G I T U D ;

// OPERADORES
MULT : '*' ;
DIV : '/' ;
MOD : M O D ;
DIV_ENTEROS : D I V ;
SUMA : '+' ;
RESTA : '-' ;
IGUAL : '=' ;
DESIGUAL : '<>' ;
MAYOR : '>' ;
MAYOR_IGUAL : '>=' ;
MENOR : '<' ;
MENOR_IGUAL : '<=' ;
OP_Y : Y ;
OP_O : O ;
NO : N O ;

// LITERALES
LITERAL_REAL : DIGITO+ '.' DIGITO*
    |                   '.' DIGITO+
    ;
LITERAL_ENTERO : DIGITO+ ;
fragment
DIGITO : [0-9] ;
LITERAL_CADENA : '"' CARACTERES_CADENA* '"' ;
fragment
CARACTERES_CADENA : ~["] | '\\"' | '\\\\' ;
LITERAL_CARACTER : '\'' CARACTERES_CARACTER '\'' ;
fragment
CARACTERES_CARACTER : ~['] | '\\\'' | '\\\\' ;
VERDADERO : V E R D A D E R O ;
FALSO : F A L S O ;

// FRAGMENTOS PARA QUE EL PARSER NO DISTINGA MAYUS/MINUS EN PALABRAS RESERVADAS
fragment A:('a'|'A');
fragment B:('b'|'B');
fragment C:('c'|'C');
fragment D:('d'|'D');
fragment E:('e'|'E');
fragment F:('f'|'F');
fragment G:('g'|'G');
fragment H:('h'|'H');
fragment I:('i'|'I');
fragment J:('j'|'J');
fragment K:('k'|'K');
fragment L:('l'|'L');
fragment M:('m'|'M');
fragment N:('n'|'N');
fragment O:('o'|'O');
fragment P:('p'|'P');
fragment Q:('q'|'Q');
fragment R:('r'|'R');
fragment S:('s'|'S');
fragment T:('t'|'T');
fragment U:('u'|'U');
fragment V:('v'|'V');
fragment W:('w'|'W');
fragment X:('x'|'X');
fragment Y:('y'|'Y');
fragment Z:('z'|'Z');

// IDENTIFICADOR (Debe de aparecer despues de todas las palabras reservadas en la gramatica)
ID : [a-zA-Z$_] [a-zA-Z0-9$_]* ;

// NUEVA LINEA, ESPACIO BLANCO (WHITESPACE) Y COMENTARIOS
NL : [\r\n]+ ;
WS : [ \t]+ -> skip ;
COMENTARIO : '/*' .*? '*/' -> skip ;
COMENTARIO_LINEA : '//' ~[\r\n]* -> skip ;
