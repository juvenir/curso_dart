void main() {
  //VARIÁVEIS

  String variavelNome = "Juvenir";
  int variavelValor = 10;
  bool ehVerdadeiro = true;
  List<String> nomeDaLista = ["juvenir", "Teixeira"];
  print(nomeDaLista[1]);
  print('${nomeDaLista[1]} - ${nomeDaLista[0]}');

  //NULL-SAFETY

  //variavel null pode receber valor e depois pode ser null novamente
  String? nome;
  nome = "juv";
  print(nome!);
  nome = null;

  //variavel late depois que recebe o valor nao pode mais ser null
  late String sobrenome;
  sobrenome = "Teixeira";
  print(sobrenome);
  sobrenome = "barbosa";

  //IF SWITCH

  bool seguir = false;
  if (seguir) {
    print("Andar");
  } else {
    print("Parar");
  }
  int valorInt = 2;
  switch (valorInt) {
    case 0:
      print("zero");
      break;
    case 1:
      print("um");
      break;
    case 2:
      print("dois");
      break;
    default:
      print("padrão");
  }

  //ESTRUTURAS DE REPETIÇÃO

  for (var i = 1; i <= 10; i++) {
    print(i);
    print(i * 2);
  }
  int contador = 10;
  while (contador != -10) {
    contador--;
    print("loop -> $contador");
  }

  //MÉTODOS E CLASSES

  Celular celularJuvenir = Celular("preto", 6, 7.7, 0.17);
  Celular celularCibele = Celular("branco", 8, 8.2, 0.23);
  //agora pode trabalhar com os atributos do celular.
  print(celularJuvenir.toString());

  double resultado = celularCibele.valorCell(500);
  print(resultado);

  //PROGRAMAÇÃO ORIENTADA AO OBJETO POO.

  Carro gol = Carro("gol");
  print(gol.setValue(30.000));

  //HERANÇA, POILIMORFISO E ABSTRAÇÃO.
}

//MÉTODOS E CLASSES
//classe por exemplo: celular é uma classe ou objeto celular.
//Atributos é bem semelhante como agente cria uma variável
//Metódos agrupam instruções.
//atributo: ex: celular=> cor, armazenamento, tamanho, processador e etc.
//final: leva responsabilidade de passar valor as variaveis para o construtor.

class Celular {
  //atributos
  final String cor;
  final int qtdProc;
  final double tamanho;
  final double peso;

  //construtor
  Celular(this.cor, this.qtdProc, this.tamanho, this.peso);

  //método
  String toString() {
    return " cor $cor, nucleos processador $qtdProc, tamanho $tamanho, peso $peso";
  }

  double valorCell(double valor) {
    return valor * qtdProc;
  }
}

//PPO
class Carro {
  final String modelo;
  //encapsulamento
  String _segredo = "acessivel somente nessa classe";
  Carro(this.modelo);
  //get dar acesso a variavel mais nao permite modificar o valor.
  double _valor = 20.000;
  double get valorCarro => _valor;
  //criando um setter para modificar a variavel privada.
  double setValue(double valor) => _valor = valor;
}
