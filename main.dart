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
}
