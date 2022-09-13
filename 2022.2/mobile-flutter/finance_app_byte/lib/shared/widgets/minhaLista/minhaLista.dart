import 'package:flutter/material.dart';
import '../../themes/app_colors.dart';
import 'listItem.dart';

class MinhaLista extends StatelessWidget {
  final entradas;
  final Function(int) deleteItem;
  const MinhaLista({
    Key? key,
    required this.deleteItem,
    required this.entradas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: entradas.length,
      itemBuilder: (_, index) => Column(children: [
        ListItem(
            deleteItem: () {
              deleteItem(index);
            },
            entrance: entradas[index]['isEntrance'] ? "Entrada" : "Saida",
            identificacao: entradas[index]['indetificacao'],
            valor: entradas[index]['valor'],
            data: entradas[index]['data']),
      ]),
    );
  }
}
