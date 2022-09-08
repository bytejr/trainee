import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:finance_app_byte/shared/themes/app_colors.dart';
import 'package:finance_app_byte/shared/themes/app_text_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/widgets/inputInsert/inputInsert.dart';

class Modal extends StatefulWidget {
  final VoidCallback closeModal;
  const Modal({
    Key? key,
    required this.closeModal,
  }) : super(key: key);

  @override
  State<Modal> createState() => _ModalState();
}

class _ModalState extends State<Modal> {
  @override
  bool isEntrance = true;
  final controller_valor = TextEditingController();
  final controller_data = TextEditingController();
  final controller_identificacao = TextEditingController();
  final controller_qtsVezes = TextEditingController();

  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Wrap(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 25,
          ),
          margin: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Cadastrar novo ativo", style: AppTextStyle.header18),
              const SizedBox(height: 10),
              const Divider(color: AppColors.stroke),
              const SizedBox(height: 10),
              Form(
                key: _formKey,
                child: Container(
                  child: Column(
                    children: [
                      // Switch de entrada ou saida
                      Row(
                        children: [
                          Text("Entrada", style: AppTextStyle.entradaSaida),
                          Transform.scale(
                            scale: 0.8,
                            child: CupertinoSwitch(
                                trackColor: AppColors.v2,
                                activeColor: AppColors.v1,
                                value: !isEntrance,
                                onChanged: (bool value) {
                                  setState(() {
                                    isEntrance = !value;
                                  });
                                }),
                          ),
                          Text("Saída", style: AppTextStyle.entradaSaida),
                        ],
                      ),

                      // Valor e identificação
                      Row(
                        children: [
                          InputInsert(
                            hintText: "Valor",
                            controller: controller_valor,
                          ),
                          InputInsert(
                            hintText: "Identificação",
                            controller: controller_identificacao,
                          ),
                        ],
                      ),
                      // Data e Numero de vezes
                      Row(
                        children: [
                          InputInsert(
                            hintText: "Data",
                            controller: controller_data,
                          ),
                          InputInsert(
                            hintText: "Nº de vezes",
                            controller: controller_qtsVezes,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      // Adicionar e fechar
                      Row(
                        children: [
                          // Botao de adicionar
                          ElevatedButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              backgroundColor: AppColors.blue2,
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                try {
                                  // Salvar a entrada
                                  final instance =
                                      await SharedPreferences.getInstance();
                                  final entradas =
                                      instance.getStringList("entradas") ??
                                          <String>[];
                                  final jsonData = {
                                    'isEntrance': isEntrance,
                                    'valor': controller_valor.text,
                                    'indetificacao':
                                        controller_identificacao.text,
                                    'data': controller_data.text,
                                    'qtsVezes': controller_qtsVezes.text
                                  };
                                  entradas.add('${jsonEncode(jsonData)}');
                                  await instance.setStringList(
                                      'entradas', entradas);
                                  widget.closeModal();
                                } catch (e) {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text("Ocorreu algum erro")));
                                }
                              }
                            },
                            child: Row(
                              children: [
                                const Icon(Icons.add_rounded,
                                    color: AppColors.white, size: 16),
                                Text("Adicionar",
                                    style: AppTextStyle.addButton),
                              ],
                            ),
                          ),

                          // Botao de fechar
                          TextButton(
                            onPressed: widget.closeModal,
                            style:
                                TextButton.styleFrom(primary: AppColors.white),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: AppColors.blue2,
                                  width: 2,
                                ),
                              ),
                              child: const Icon(
                                Icons.close_rounded,
                                color: AppColors.blue2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
