import "package:flutter/material.dart";

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Fundamentos"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.yellow,
            ),
            // SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              height: 100,
              width: 200,
              color: Colors.green,
            ),
            // SizedBox(height: 10),
            Text("Text normal"),
            Image.asset("assets/mario.jpg"),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                print('clicou');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home, color: Colors.blue),
                  Text("Botão"),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Color.fromARGB(255, 185, 242, 27),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MeuBotao(icon: Icons.add, title: "Adicionar"),
                    MeuBotao(icon: Icons.home, title: "Home"),
                    MeuBotao(icon: Icons.help, title: "Ajuda"),
                  ],
                ),
              ),
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
          onPressed: () {
            print('clicou em $title');
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              Text(title),
            ],
          )),
    );
  }
}
