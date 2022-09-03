Future<String?> getName(bool found) async {
  // await Future.delayed(Duration(seconds: 5));
  if (found) {
    return 'Vítor';
  } else {
    return null;
  }
}

void main() async {
  String? isName = await getName(true);
  String name;
  name = isName ?? "Não encontrei o usuário";
  // name = isName!;
  // if (isName == null) {
  //   name = 'Não encontrei o usuário';
  // } else {
  //   name = isName;
  // }

  // print(name);

  User vitor = User(name: "Vítor", dataDeNascimento: "10/03/2002", peso: 60.4);

  print(vitor.peso);
  vitor.incrementPeso();
  print(vitor.peso);
}

class User {
  final String name; //Obrigatorio
  final String dataDeNascimento; //Obrigatorio
  double? peso; // opcional
  double? altura; // altura
  final bool isMale; //padrao

  User({
    required this.name,
    required this.dataDeNascimento,
    this.peso,
    this.altura,
    this.isMale = true,
  });

  void incrementPeso() {
    if (peso != null) {
      peso = peso! + 1;
    }
  }
}
