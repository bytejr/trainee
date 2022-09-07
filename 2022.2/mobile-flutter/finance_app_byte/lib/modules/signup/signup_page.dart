import 'package:finance_app_byte/shared/themes/app_colors.dart';
import 'package:finance_app_byte/shared/themes/app_images.dart';
import 'package:finance_app_byte/shared/themes/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../shared/widgets/Dotted Divider/dotted_divider_forms.dart';
import '../../shared/widgets/Dotted Divider/dotted_divider_header.dart';
import '../../shared/widgets/footer/fotter.dart';

class Signup_Page extends StatelessWidget {
  const Signup_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFDBDCFD), Color(0xFFEEEEEE)]),
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.moneyLogo),
                Expanded(
                  child: Column(
                    children: [
                      Text('Controle financeiro',
                          style: AppTextStyle.regular28),
                      DottedDividerHeader(),
                    ],
                  ),
                ),
              ],
            ),

            // Formulário
            Container(
              margin: EdgeInsets.only(top: 65),
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.white,
              ),
              child: Column(
                children: [
                  // Titulo do forms
                  Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Organize seu futuro',
                            style: AppTextStyle.header22),
                        DottedDividerForms(),
                        Text("Tenha acesso as suas",
                            style: AppTextStyle.subtitulo),
                        Text("finanças em qualquer lugar",
                            style: AppTextStyle.subtitulo),
                      ],
                    ),
                  ),

                  // Divisor
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Divider(color: AppColors.stroke),
                  ),

                  // O forms

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cadastre-se",
                        style: AppTextStyle.header22,
                      ),
                      Form(
                        key: _formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Email
                            SizedBox(height: 5),
                            Text('Email', style: AppTextStyle.regular),
                            TextFormField(
                              validator: (value) {
                                return;
                              },
                              style: AppTextStyle.light,
                              decoration: const InputDecoration(
                                hintText: "olaph@bytejr.com",
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.stroke),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.stroke),
                                ),
                              ),
                            ),

                            // Senha
                            SizedBox(height: 5),
                            Text('Senha', style: AppTextStyle.regular),
                            TextFormField(
                              obscureText: true,
                              validator: (value) {
                                return;
                              },
                              style: AppTextStyle.light,
                              decoration: const InputDecoration(
                                hintText: "*******",
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.stroke),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.stroke),
                                ),
                              ),
                            ),

                            // Confirmar senha
                            SizedBox(height: 5),
                            Text('Confirmar senha',
                                style: AppTextStyle.regular),
                            TextFormField(
                              obscureText: true,
                              validator: (value) {
                                return;
                              },
                              style: AppTextStyle.light,
                              decoration: const InputDecoration(
                                hintText: "*******",
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.stroke),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.stroke),
                                ),
                              ),
                            ),

                            // Botão de cadastre-se
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.symmetric(vertical: 5),
                              width: 130,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: AppColors.blue1),
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Text("Cadastrar",
                                        style: AppTextStyle.addButton),
                                    Icon(Icons.done_rounded,
                                        color: AppColors.white, size: 16),
                                  ],
                                ),
                              ),
                            ),

                            // ja possui uma conta
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              decoration: const BoxDecoration(
                                  border: Border(
                                bottom: BorderSide(
                                  color: AppColors.blue1,
                                  width: 1,
                                ),
                              )),
                              child: Text('Já possuí uma conta? Entre agora',
                                  style: AppTextStyle.light),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
