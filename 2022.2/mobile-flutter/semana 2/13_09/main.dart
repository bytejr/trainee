int? getIdade(bool found) {
  if (found) {
    return 20;
  } else {
    return null;
  }
}

Future<String?> getnome(bool found) async {
  // await AcessarOBanco()
  await Future.delayed(Duration(seconds: 0));
  if (found) {
    return 'Vitor';
  } else {
    return null;
  }
}

void main() async {
  int? idade = getIdade(true);
  if (idade == null) {
    idade = 30;
  }
  int idadeReal = idade;

  // String? nome = getnome(false);
  String? nome = await getnome(false);
  // String nomeReal = nome!;
  String nomeReal = nome ?? "Sem nome";
  print(nomeReal);

  User Vitor = User(username: 'vitor', idade: 20);
  print(Vitor.idade);
  Vitor.incrementIdade();
  print(Vitor.idade);
}

class User {
  final String username; // Obrigatório
  bool isMale; // Padrao
  int idade; // Obrigatório
  double? altura; // Opcional
  User({
    required this.username,
    this.isMale = true,
    required this.idade,
    this.altura,
  });

  // User({required this.username, this.isMale = true, this.idade, this.altura});

  incrementIdade() {
    idade++;
  }
}
