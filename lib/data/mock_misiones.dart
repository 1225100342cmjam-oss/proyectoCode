import '../modelo/misiones.dart';

const categories = ['Variables', 'Condicionales', 'Ciclos', 'Funciones', 'Depuración'];

const missions = <Mission>[
  Mission(
    id: 'm1', title: 'La caja fuerte', category: 'Variables',
    description: 'Una caja guarda datos. Descubre qué tipo de valor oculta cada una.',
    story: 'Alguien dejó una caja fuerte abierta en la oficina. Dentro hay tres notas: un número, un nombre y un estado. Identifica qué guarda cada variable para seguir la pista.',
    image: 'assets/images/m1.png', xp: 50, difficulty: 1, minutes: 5,
    code: 'int clave = 42;\nString dueno = "Ana";\nbool abierta = false;',
    questions: [
      QuizQuestion(question: '¿Qué tipo de dato es "Ana"?', options: ['int', 'String', 'bool'], correct: 1, feedback: 'Un texto entre comillas es un String.'),
      QuizQuestion(question: 'Si ejecutas clave = clave + 1, ¿cuánto vale clave?', options: ['41', '42', '43'], correct: 2, feedback: 'Se toma el valor actual (42) y se le suma 1.'),
    ],
  ),
  Mission(
    id: 'm2', title: 'El recibo manchado', category: 'Variables',
    description: 'Un recibo tiene manchas. Calcula el total con números decimales.',
    story: 'El recibo de la tienda quedó manchado y no se lee el total. Usa las variables para reconstruirlo.',
    image: 'assets/images/m2.png', xp: 60, difficulty: 1, minutes: 6,
    code: 'double precio = 12.5;\nint cantidad = 3;\ndouble total = precio * cantidad;',
    questions: [
      QuizQuestion(question: '¿Cuánto vale total?', options: ['15.5', '37.5', '36'], correct: 1, feedback: '12.5 × 3 = 37.5.'),
      QuizQuestion(question: '¿Qué tipo sirve para números con decimales?', options: ['double', 'String', 'bool'], correct: 0, feedback: 'double guarda números decimales.'),
    ],
  ),
  Mission(
    id: 'm3', title: 'El guardia de turno', category: 'Condicionales',
    description: 'Según la hora, el guardia dice una cosa u otra. ¿Cuál?',
    story: 'El guardia saluda distinto según la hora. Su saludo revela a qué hora llegó el sospechoso.',
    image: 'assets/images/m3.png', xp: 70, difficulty: 1, minutes: 6,
    code: 'int hora = 9;\nif (hora < 12) {\n  print("Buenos días");\n} else {\n  print("Buenas tardes");\n}',
    questions: [
      QuizQuestion(question: '¿Qué imprime el código?', options: ['Buenos días', 'Buenas tardes', 'Nada'], correct: 0, feedback: '9 es menor que 12, así que entra al if.'),
      QuizQuestion(question: '¿Cuándo se ejecuta el bloque else?', options: ['Siempre', 'Cuando la condición del if es falsa', 'Nunca'], correct: 1, feedback: 'else cubre el caso en que el if no se cumple.'),
    ],
  ),
  Mission(
    id: 'm4', title: 'La puerta con dos llaves', category: 'Condicionales',
    description: 'Para abrir hacen falta dos condiciones al mismo tiempo.',
    story: 'La bóveda solo se abre si tienes la llave y conoces la clave. Combina condiciones con operadores lógicos.',
    image: 'assets/images/m4.png', xp: 80, difficulty: 2, minutes: 8,
    code: 'bool tieneLlave = true;\nbool sabeClave = false;\nif (tieneLlave && sabeClave) {\n  print("Abierta");\n}',
    questions: [
      QuizQuestion(question: '¿Se imprime "Abierta"?', options: ['Sí', 'No'], correct: 1, feedback: '&& exige que ambas condiciones sean verdaderas.'),
      QuizQuestion(question: '¿Qué significa el operador &&?', options: ['o', 'y', 'no'], correct: 1, feedback: '&& es "y"; || es "o"; ! es "no".'),
    ],
  ),
  Mission(
    id: 'm5', title: 'Las huellas en la nieve', category: 'Ciclos',
    description: 'Cuenta cuántas huellas deja un ciclo for.',
    story: 'Una cadena de huellas lleva a la cabaña. Cuenta cuántas hay siguiendo el ciclo.',
    image: 'assets/images/m5.png', xp: 80, difficulty: 2, minutes: 8,
    code: 'for (int i = 0; i < 3; i++) {\n  print(i);\n}',
    questions: [
      QuizQuestion(question: '¿Cuántas veces se repite el ciclo?', options: ['2', '3', '4'], correct: 1, feedback: 'i toma los valores 0, 1 y 2.'),
      QuizQuestion(question: '¿Cuál es el último valor que se imprime?', options: ['2', '3', '0'], correct: 0, feedback: 'Cuando i vale 3 la condición i < 3 ya es falsa.'),
    ],
  ),
  Mission(
    id: 'm6', title: 'El reloj que no se detiene', category: 'Ciclos',
    description: 'Un ciclo while puede no terminar nunca. Descubre cuándo para.',
    story: 'El reloj de la torre resta dos minutos en cada vuelta. ¿Cuántas vueltas da antes de detenerse?',
    image: 'assets/images/m6.png', xp: 90, difficulty: 2, minutes: 9,
    code: 'int n = 5;\nwhile (n > 0) {\n  n = n - 2;\n}',
    questions: [
      QuizQuestion(question: '¿Cuántas vueltas da el ciclo?', options: ['2', '3', '5'], correct: 1, feedback: 'n pasa por 5 → 3 → 1 → -1. Son 3 vueltas.'),
      QuizQuestion(question: '¿Qué pasa si n nunca cambia dentro del while?', options: ['Termina solo', 'Ciclo infinito', 'Error de tipos'], correct: 1, feedback: 'La condición seguiría siendo verdadera para siempre.'),
    ],
  ),
  Mission(
    id: 'm7', title: 'La máquina de cifrado', category: 'Funciones',
    description: 'Una función transforma entradas en salidas. Descifra su regla.',
    story: 'Los mensajes secretos pasan por una máquina que los duplica. Entiende la función para leerlos.',
    image: 'assets/images/m7.png', xp: 100, difficulty: 2, minutes: 10,
    code: 'int duplicar(int x) {\n  return x * 2;\n}\n\nprint(duplicar(4));',
    questions: [
      QuizQuestion(question: '¿Qué imprime duplicar(4)?', options: ['4', '8', '6'], correct: 1, feedback: '4 × 2 = 8.'),
      QuizQuestion(question: '¿Para qué sirve return?', options: ['Repite la función', 'Devuelve un valor a quien la llamó', 'Borra la variable'], correct: 1, feedback: 'return entrega el resultado y termina la función.'),
    ],
  ),
  Mission(
    id: 'm8', title: 'El bug del ladrón', category: 'Depuración',
    description: 'Hay un error escondido en el código. Encuéntralo y atrapa al culpable.',
    story: 'El ladrón dejó un bug. La función suma no devuelve lo esperado y el ciclo se sale de la lista.',
    image: 'assets/images/m8.png', xp: 120, difficulty: 3, minutes: 12,
    code: 'int suma(int a, int b) {\n  return a - b; // error\n}\n\nvar lista = [1, 2, 3];\nfor (int i = 0; i <= 3; i++) {\n  print(lista[i]);\n}',
    questions: [
      QuizQuestion(question: 'suma(2, 3) debería dar 5. ¿Cuál es el error?', options: ['Usa - en lugar de +', 'Falta un parámetro', 'El tipo es incorrecto'], correct: 0, feedback: 'Debe ser a + b.'),
      QuizQuestion(question: 'La lista tiene 3 elementos. ¿Qué falla en el ciclo?', options: ['i empieza en 0', 'i <= 3 llega a un índice inexistente', 'print no funciona'], correct: 1, feedback: 'Los índices válidos son 0, 1 y 2. Debe ser i < 3.'),
    ],
  ),
];

const dictionary = <String, String>{
  'Variable': 'Espacio con nombre donde se guarda un valor que puede cambiar.',
  'Tipo de dato': 'Clase de valor que guarda una variable: int, double, String, bool.',
  'Condicional': 'Estructura (if / else) que ejecuta código solo si se cumple una condición.',
  'Operador lógico': '&& (y), || (o) y ! (no) combinan o invierten condiciones.',
  'Ciclo': 'Estructura (for / while) que repite un bloque de código.',
  'Función': 'Bloque de código con nombre que se puede reutilizar.',
  'Parámetro': 'Dato que una función recibe para trabajar.',
  'Return': 'Instrucción que devuelve un valor desde una función.',
  'Bug': 'Error en el código que produce un resultado inesperado.',
  'Depuración': 'Proceso de buscar y corregir bugs.',
};
