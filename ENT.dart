import 'dart:io';

void main(List<String> args) {
  //valor numerico de los simbolos de escritura
  Map alfabeto = new Map();
  alfabeto = {
    'a': 1,
    'b': 2,
    'c': 3,
    'd': 4,
    'e': 5,
    'f': 6,
    'g': 7,
    'h': 8,
    'i': 9,
    'j': 10,
    'k': 11,
    'l': 12,
    'm': 13,
    'n': 14,
    'ñ': 15,
    'o': 16,
    'p': 17,
    'q': 18,
    'r': 19,
    's': 20,
    't': 21,
    'u': 22,
    'v': 23,
    'w': 24,
    'x': 25,
    'y': 26,
    'z': 27,
    ' ': 28,
    '0': 29,
    '1': 30,
    '2': 31,
    '3': 32,
    '4': 33,
    '5': 34,
    '6': 35,
    '7': 36,
    '8': 37,
    '9': 38
  };

  //representacion simbolica de los numeros
  Map numeros = new Map();
  numeros = {
    0: ' ',
    1: 'a',
    2: 'b',
    3: 'c',
    4: 'd',
    5: 'e',
    6: 'f',
    7: 'g',
    8: 'h',
    9: 'i',
    10: 'j',
    11: 'k',
    12: 'l',
    13: 'm',
    14: 'n',
    15: 'ñ',
    16: 'o',
    17: 'p',
    18: 'q',
    19: 'r',
    20: 's',
    21: 't',
    22: 'u',
    23: 'v',
    24: 'w',
    25: 'x',
    26: 'y',
    27: 'z',
    28: ' ',
    29: '0',
    30: '1',
    31: '2',
    32: '3',
    33: '4',
    34: '5',
    35: '6',
    36: '7',
    37: '8',
    38: '9'
  };
  if (args[0] == 'e') {
    //desplazamiento para el cifrado
    int clave;
    stdout.writeln('ingrese la clave con la que va a Encriptar');
    clave = int.parse(stdin.readLineSync());
    //  comparacion de texto entracte con texto local para cambiar valores
    new File(args[1]).readAsString().then((String mensaje) {
      print(mensaje);
      List<String> mensajeArray = mensaje.split('');
      List<int> numeros_de_letras_array = new List<int>();
      //convertir letras en numeros y almacenarlos en array
      mensajeArray.forEach((element) {
        var numeros_Letras = alfabeto[element];
        numeros_de_letras_array.add(numeros_Letras);
      });
      // operacion para encriptado y resultado de la encriptacion
      String encriptado = '';
      List letras_de_numeros_array = new List();
      numeros_de_letras_array.forEach((x) {
        var numeros_Letras_formula = (x + clave) % 38;
        String letras_Numeros = numeros[numeros_Letras_formula];
        letras_de_numeros_array.add(letras_Numeros);
        encriptado += letras_Numeros;
      });
      print(encriptado);
      //crear archivo cifrado
      final fileName = 'd:/mensaje cifrado.txt';
      new File(fileName).writeAsString(encriptado).then((File file) {
        print('archivo creado');
      });
    });
  } else if (args[0] == 'd') {
    int clave;
    stdout.writeln('ingrese la clave para  Desencriptar');
    clave = int.parse(stdin.readLineSync());
    // comparacio de texto entrate encriptado par remplarzar valores
    String desencriptado = '';
    new File(args[1]).readAsString().then((String mensaje2) {
      print(mensaje2);
      List<String> letras_de_numeros_array = mensaje2.split('');
      List<int> numeros_de_letras_encriptadas_array = new List<int>();
      //convertir letras en numeros
      letras_de_numeros_array.forEach((element) {
        var numeros_Letras = alfabeto[element];
        numeros_de_letras_encriptadas_array.add(numeros_Letras);
      });
// operacion y resultado de desencriptacion
      List letras_de_numeros_encriptados_array = new List();
      numeros_de_letras_encriptadas_array.forEach((x) {
        var numeros_Letras_formula = (x - clave) % 38;
        var letras_Numeros = numeros[numeros_Letras_formula];
        letras_de_numeros_encriptados_array.add(letras_Numeros);
        desencriptado += letras_Numeros;
      });
      print(desencriptado);
      //crear archivo decifrado
      final fileName = 'd:/mensaje decifrado.txt';
      new File(fileName).writeAsString(desencriptado).then((File file) {
        print('archivo creado');
      });
    });
  }
}
// ruta mensaje cifrado d:/mensaje cifrado.txt
//dart .\ENT.dart e d:/mensaje.txt
// dart .\ENT.dart e d:/mensaje.txt. d:/mensaje decifrado.txt;

// ruta mensaje decifrado d:/mensaje decifrado.txt;
// dart .\ENT.dart d d:/desencriptado.txt
// dart .\ENT.dart d d:/mensaje.txt. d:/mensaje decifrado.txt;
