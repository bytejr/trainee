String oiParaUser(String nomeDoUser) {
  return "Olá $nomeDoUser";
}

void main() {
  // -- Variaveis --
  int a = 1;
  // int a = 2.3;
  // int a = "ola";

  double preco = 45.30;

  String nome;
  nome = "eduardo";

  List<String> listaDeCompras = ['Uva', "Maçã"];
  listaDeCompras.add("Pessego");
  print(listaDeCompras);

  Object objeto = {'chave': 'Valor'};

  var variavel = 3;
  dynamic dinamico;

  // -- Estruturas --

  if (a == preco) {
    print('A é igual ao preço');
  } else {
    print('A é diferente do preço');
  }
  switch (a) {
    case 1:
      print('1');
      break;
    case 2:
      print('2');
      break;
    default:
      print('padrão');
      break;
  }

  for (var i = 0; i < 5; i++) {
    print(i);
  }

  int i = 0;
  while (i < 5) {
    print(i);
    i++;
  }

  // -- Funções --

  String text = oiParaUser(nome);
  print(text);

  return;
}
