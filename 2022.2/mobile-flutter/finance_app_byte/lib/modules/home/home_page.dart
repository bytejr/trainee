import 'package:finance_app_byte/modules/home/home_controller.dart';
import 'package:finance_app_byte/modules/modal/modal.dart';
import 'package:finance_app_byte/shared/themes/app_colors.dart';
import 'package:finance_app_byte/shared/themes/app_text_style.dart';
import 'package:finance_app_byte/shared/widgets/header/header.dart';
import "package:flutter/material.dart";

import '../../shared/widgets/footer/fotter.dart';
import '../../shared/widgets/minhaLista/minhaLista.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController homeController = HomeController();
  @override
  void initState() {
    super.initState();
    homeController.addListener(() {
      setState(() {});
    });
  }

  bool isModalVisible = false;

  void openModal() {
    setState(() {
      isModalVisible = true;
    });
  }

  void closeModal() {
    homeController.getListaItems();
    setState(() {
      isModalVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Parte principal da Home

            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFDBDCFD), Color(0xFFEEEEEE)],
              )),
              child: Column(
                children: [
                  const Header(),

                  // Balanço mensal
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.white,
                    ),
                    child: Column(children: [
                      Text("Total do mês atual", style: AppTextStyle.header18),

                      // Entradas e saidas
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Entradas
                          Column(
                            children: [
                              Text("Entrou", style: AppTextStyle.light),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColors.v2,
                                ),
                                child: Text("299,99 R\$",
                                    style: AppTextStyle.header18),
                              ),
                            ],
                          ),
                          // Entradas
                          Column(
                            children: [
                              Text("Saída", style: AppTextStyle.light),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColors.v1,
                                ),
                                child: Text("199,99 R\$",
                                    style: AppTextStyle.header18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]),
                  ),

                  // Parte da lista

                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.white,
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      child: Column(
                        children: [
                          // cabeçalho e o botão para adicionar nova entrada
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Histórico Deste Mês",
                                  style: AppTextStyle.header),
                              ElevatedButton(
                                onPressed: openModal,
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5),
                                  backgroundColor: AppColors.blue2,
                                ),
                                child: Row(
                                  children: [
                                    Text("Nova entrada",
                                        style: AppTextStyle.addButton),
                                    const Icon(Icons.add_rounded,
                                        color: AppColors.white, size: 35),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: ValueListenableBuilder(
                                  valueListenable:
                                      homeController.listaItemsNotifier,
                                  builder: (_, entradas, __) {
                                    if (entradas == null || entradas == []) {
                                      return const Center(
                                          child: Text(
                                              "Adicione uma nova entrada"));
                                    }
                                    return MinhaLista(
                                        entradas: entradas,
                                        deleteItem:
                                            homeController.deleteEntrace);
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Footer(),
                ],
              ),
            ),

            // Tela transparente/azul
            InkWell(
              onTap: closeModal,
              child: Visibility(
                visible: isModalVisible,
                child: Opacity(
                  opacity: 0.8,
                  child: Container(
                    color: AppColors.blue1,
                  ),
                ),
              ),
            ),

            Visibility(
              visible: isModalVisible,
              child: Align(
                alignment: Alignment.center,
                child: Modal(closeModal: closeModal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
