# Pepite's game 
En este juego desarrollado en Wollok Game para la materia Programación con objetos I, el objetivo principal es completar los cinco niveles disponibles recogiendo un tesoro (una moneda) al final de cada uno. Para lograrlo, deberás superar diferentes desafíos y ganar trofeos que te darán acceso a los niveles más avanzados.
## Equipo de desarrollo

- Lasota, Pablo
- Gómez, Leandro
- Ferreyra, Amanda

## Capturas

- Intro


![instrucciones](https://github.com/user-attachments/assets/5e4f5a26-3335-4cc1-860f-6c1cfa969425)


- Instrucciones



![inicio](https://github.com/user-attachments/assets/17bc84be-06cc-4f99-99ec-3b3551a979a2)



- Lobby



![LOBBY](https://github.com/user-attachments/assets/99ed048e-38cc-4525-9ad9-af399d68eeb5)



- Tienda con niveles completados



![tiendaNivel4](https://github.com/user-attachments/assets/7f7bab30-1a84-46cb-9b68-cc69ac1c88ec)




## Reglas de Juego / Instrucciones 

Inicia el juego y explora el lobby.
Entra en los niveles para recolectar tesoros y ganar trofeos.
Avanza a través de los niveles desbloqueados hasta completar el quinto nivel.
Reúnete con el perro de Pepite para ganar el juego.


## Características principales
Lobby inicial: Es el punto de partida del juego. Aquí se encuentran:

Cinco puertas: Cada una lleva a un nivel diferente.  
Tienda: Muestra la cantidad de trofeos obtenidos.  
Héctor: Un NPC que aparece en cinemáticas previas a cada nivel, explicando las tareas a realizar.  

Acceso a niveles: Los niveles se desbloquean en función de la cantidad de trofeos que tenga Pepite:

Nivel 1: 0 o más trofeos.  
Nivel 2: 1 o más trofeos.  
Nivel 3: 2 o más trofeos.  
Nivel 4: 3 o más trofeos.  
Nivel 5: 4 o más trofeos.  
Objetivo final: En el último nivel, Pepite deberá encontrar y reunirse con su perro Ringo para completar la aventura y ganar el juego.

Enfoque técnico y diseño
El desarrollo del juego implementa conceptos clave de programación orientada a objetos para lograr un código limpio, reutilizable y fácil de mantener:

Polimorfismo:
Las acciones de los personajes y las interacciones con los elementos del juego se gestionan a través de clases con comportamientos comunes, que son personalizadas según el objeto. Esto permite que el código sea flexible y se pueda extender fácilmente.

Delegación:
Se utilizó la delegación para distribuir responsabilidades en distintas clases, reduciendo la complejidad de las funciones principales.

Herencia para eliminar código duplicado:
Las clases relacionadas con personajes, puertas y objetos del juego heredan de clases base que encapsulan comportamientos comunes. Esto elimina redundancias y asegura consistencia en las funcionalidades.
Tests automatizados:
El juego incluye pruebas automatizadas para verificar el correcto funcionamiento de las mecánicas principales, como el acceso a niveles, la recolección de trofeos y la interacción con Héctor. Esto asegura que los cambios futuros en el código no introduzcan errores inesperados.


## Otros

- Programación con objetos I
- Versión de wollok 0.2.7
- Una vez terminado, no tenemos problemas en que el repositorio sea público / queremos manternerlo privado

#¡Gracias por jugar! 🏆
