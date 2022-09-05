import 'package:flutter/material.dart';
import 'package:radio_byte/shared/themes/app_colors.dart';
import 'package:radio_byte/shared/themes/app_text_style.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(22),
          margin: EdgeInsets.all(22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(27),
            color: AppColors.black,
          ),
          child: Row(
            children: [
              Text("Radio Byte jr.", style: AppTextStyle.headerTitle),
              SizedBox(width: 15),
              Icon(Icons.radio, color: AppColors.bege)
            ],
          ),
        ),
      ],
    );
  }
}
