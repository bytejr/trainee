import 'package:finance_app_byte/shared/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import '../../themes/app_colors.dart';

class ListItem extends StatelessWidget {
  final deleteItem;
  String entrance;
  String valor;
  String identificacao;
  String data;
  ListItem({
    Key? key,
    required this.entrance,
    required this.valor,
    required this.identificacao,
    required this.data,
    required this.deleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: AppColors.stroke),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            children: [
              Column(children: [
                Text(entrance,
                    style: (entrance == "Entrada")
                        ? AppTextStyle.listItemEntrada
                        : AppTextStyle.listItemSaida),
                Text(valor, style: AppTextStyle.light),
              ]),
              SizedBox(width: 15),
              Column(children: [
                Text(identificacao, style: AppTextStyle.light),
                Text(data, style: AppTextStyle.light),
              ]),
              Spacer(),
              TextButton.icon(
                style: TextButton.styleFrom(primary: AppColors.white),
                onPressed: deleteItem,
                icon:
                    Icon(Icons.delete_forever_outlined, color: AppColors.blue1),
                label: Text(""),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
