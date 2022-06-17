import 'dart:convert';

void main() async {
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
  //usado apenas nas classes abaixo.

  //herança
  Filho juvenir = Filho();
  print(juvenir.falar());

  //usando o poliformismo
  Pagamento pagamento = PgBoleto();
  pagamento.pagar();

  pagamento = PgPix();
  pagamento.pagar();

//Future
  //String nome3 = "Débora";
  Future<String> cepFuture = cepByName("julio 2");
  late String cep;
  //cepfuture.then((result)=> cep = result);
  cep = await cepFuture;
  print(cep);

  //MAP
  //{chave,valor}
  Map<String, String> mapa = {'chave': 'valor'};
  print(mapa);
  print(mapa['chave']);
  //add nova chave
  //metodo 1
  mapa.putIfAbsent('nova chave', () => 'novo valor');
  //metodo 2
  mapa['nopvachave2'] = 'novo valor2';
  //deletar uma chave
  mapa.remove('chave');
  //atualizar uma chave
  //metodo 1
  mapa['nova chave'] = 'atualizado';
  //metodo 2
  mapa.update('nova chave', (value) => 'atualizado de novo');
  //interagir com as chaves
  mapa.forEach((chave, valor) => print('a chave $chave, o valor $valor'));
  mapa.keys.forEach(print);
  mapa.values.forEach(print);

  //JSON
  String json = ''' {
     "user": "juvenir",
     "pass": "1234",
     "permissions": [
       "owner", "admin"
     ]
     }
   ''';

  print(json);

  //dessa forma agente trabalha com json como se fosse um mapa.
  var resultJson = jsonDecode(json);
  print(resultJson);
  print(resultJson['user']);
  print(resultJson['permissions'][0]);
  //agora fazer ao contrário, transformar mapa em json
  var resultMap = jsonEncode(mapa);
  print(resultMap);

  //CALL
  BuscaNome buscaNome = BuscaNome();
  buscaNome();
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

//Abstração. cria um método e quem implementar(assinar o contrato)
// precisa retornar o valor.

abstract class Pessoa {
  String comunicar();
}

//Assinando o contrato da abstração
class PessoaAbs implements Pessoa {
  String comunicar() {
    return "comunicado";
  }
}

//Herança é o contrário da abstração
class Pai {
  String falar() {
    return "fala muito rápido";
  }
}

//herdando o método para essa classe
class Filho extends Pai {}
//exemplo acima na main.

//Polimofismo
abstract class Pagamento {
  void pagar();
}

class PgBoleto implements Pagamento {
  void pagar() {
    print("pago com boleto");
  }
}

class PgPix implements Pagamento {
  void pagar() {
    print("pago com pix");
  }
}

//FUTURE, ASYNC E AWAIT
Future<String> cepByName(String name) {
  return Future.value("62504-690");
}

class BuscaNome {
  void call() => print("Juvenir, Cibele, Débora");
}
