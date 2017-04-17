# LPP

Este proyecto es un compilador de LPP (Lenguaje de Programación para Principiantes) a bytecode de
 la maquina virtual de Java.

## El Lenguaje

Pueden ver la gramática del lenguaje en el archivo `src/main/antlr4/org/lpp/parser/LPP.g4`. 
Pueden ver algunos ejemplos del lenguaje en el directorio `src/test/resources/ejemplos/`.

## Tecnologias

Se esta utilizando [ANTLR4](http://www.antlr.org/) para generar el analizador léxico y sintáctico. 
Se planea utilizar [ASM](http://asm.ow2.org/) para la generación de Java Bytecode. 

## Trabajando en el Proyecto

Se necesita _Java 8_ y _Maven_ para compilar el proyecto. El comando `mvn compile` compila la 
gramática, los archivos fuentes, y los generados por la gramática. El comando `mvn test` corre 
las pruebas unitarias y comprueba los ejemplos en `src/test/resources/ejemplos/` contra la 
gramática generada.

## Para Contribuír

1. Hacele un Fork al proyecto.
2. Crea un branch: `git checkout -b lo-nuevo`
3. Hacele commit a tu cambio: `git commit -am 'Agregue algo nuevo'`
4. Hacele Push al branch: `git push origin lo-nuevo`
5. Crea un pull request :D

## Creditos

Muchas gracias a [Iván Deras](https://github.com/ideras) por haber creado LPP para su proyecto de
 graduación, y por haberle dado el visto bueno a este proyecto.

## Licencia

MIT - Ver el archivo `LICENSE` para mas detalles.
