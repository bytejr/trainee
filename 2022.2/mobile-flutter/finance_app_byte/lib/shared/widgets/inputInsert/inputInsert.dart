import 'package:flutter/material.dart';

import 'package:finance_app_byte/shared/themes/app_colors.dart';
import 'package:finance_app_byte/shared/themes/app_text_style.dart';

class InputInsert extends StatelessWidget {
  final String hintText;
  final controller;

  const InputInsert({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.35,
      height: 40,
      margin: const EdgeInsets.only(top: 3, right: 3, bottom: 3),
      child: TextFormField(
        controller: controller,
        style: AppTextStyle.light,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 3),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.stroke)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.stroke)),
        ),
      ),
    );
  }
}
