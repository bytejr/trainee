import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Meu Primeiro App"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Image.asset("assets/muro.jpg"),

            // Descrição
            Container(
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Texto de descrição e localização
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Muro das lamentações',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Jerusálem, Israel'),
                    ],
                  ),

                  // Avaliação e likes
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text('9.876'),
                    ],
                  ),
                ],
              ),
            ),
            // Botoes sociais
            Row(children: [
              MeuBotao(icon: Icons.phone, title: 'Ligar'),
              MeuBotao(icon: Icons.gps_fixed_outlined, title: 'Endereço'),
              MeuBotao(icon: Icons.share, title: 'Compartilhar'),
            ]),
            // Texto
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                  'Contrary to popular belief, Lorem IpsContrary to popular belief, Lorem IpsContrary to popular belief, Lorem IpsContrary to popular belief, Lorem IpsContrary to popular belief, Lorem IpsContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lore'),
            ),
          ],
        ),
      ),
    );
  }
}

class MeuBotao extends StatelessWidget {
  final IconData icon;
  final String title;
  const MeuBotao({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: () {},
        child: Container(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          child: Column(
            children: [
              Icon(icon),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
