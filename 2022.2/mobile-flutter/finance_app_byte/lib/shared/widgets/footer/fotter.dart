import 'package:finance_app_byte/shared/themes/app_colors.dart';
import 'package:finance_app_byte/shared/themes/app_images.dart';
import 'package:finance_app_byte/shared/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AppImages.byteIcon,
            width: 40,
            height: 40,
          ),
          Text("Projeto trainee 2022/2", style: AppTextStyle.light),
        ],
      ),
    );
  }
}
