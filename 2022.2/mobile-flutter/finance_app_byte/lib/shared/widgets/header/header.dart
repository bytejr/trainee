import 'package:finance_app_byte/shared/themes/app_colors.dart';
import 'package:finance_app_byte/shared/themes/app_images.dart';
import 'package:finance_app_byte/shared/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Drawer
        SizedBox(
          height: 40,
          width: 40,
          child: TextButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.white)),
            onPressed: () {},
            child: Icon(
              Icons.menu,
              color: AppColors.blue1,
            ),
          ),
        ),
        Spacer(),
        // Nome e email
        Column(
          children: [
            Text('Olaph Jr', style: AppTextStyle.header),
            Text('Olaph@bytejr.com', style: AppTextStyle.light),
          ],
        ),
        // Imagem de cara feliz
        Container(
            margin: EdgeInsets.only(left: 5),
            child: Image.asset(
              AppImages.happyIcon,
              height: 40,
              width: 40,
            )),
      ],
    );
  }
}
