import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController with ChangeNotifier {
  final listaItemsNotifier = ValueNotifier<List<dynamic>?>(null);
  get listaItems => listaItemsNotifier.value;

  HomeController() {
    getListaItems();
  }

  void getListaItems() {
    getEntrances();
  }

  set listaItems(dynamic value) => listaItemsNotifier.value = value;

  Future<void> getEntrances() async {
    final instance = await SharedPreferences.getInstance();
    final List<String>? items = instance.getStringList('entradas');
    if (items == null || items.length == 0) {
      listaItems = null;
      return;
    }
    List<dynamic> newItems = [];

    for (int i = 0; i < items.length; i++) {
      var parse = jsonDecode(items[i]);
      newItems.add(parse);
    }
    listaItems = newItems;
  }

  Future<void> deleteEntrace(int id) async {
    final instance = await SharedPreferences.getInstance();
    final List<String>? items = instance.getStringList('entradas');
    if (items == null || id >= items.length) {
      return;
    }
    items.removeAt(id);

    await instance.setStringList('entradas', items);

    getListaItems();
  }
}
