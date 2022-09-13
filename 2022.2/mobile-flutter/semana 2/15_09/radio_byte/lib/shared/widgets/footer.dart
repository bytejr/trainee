import 'package:flutter/material.dart';
import 'package:radio_byte/shared/themes/app_colors.dart';
import 'package:radio_byte/shared/themes/app_images.dart';
import 'package:radio_byte/shared/themes/app_text_style.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      margin: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AppImages.byte,
              fit: BoxFit.fitHeight,
            ),
            Text("Projeto trainee 2022/2",
                style: AppTextStyle.footerDescription),
          ],
        ),
      ),
    );
  }
}
