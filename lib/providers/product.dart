import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constants.dart';
import '../models/models.dart';
import 'package:http/http.dart' as http;

class ProductsProvider extends ChangeNotifier {
  List<Category> categories = [];
  List<Product> products = [];
  bool isCategoryLoading = true;
  bool isProductLoading = true;

  Future<void> getCategories() async {
    try {
      isCategoryLoading = true;
      notifyListeners();
      final response = await http.get(Uri.parse(kEndPointUrl + 'categories'));
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        final List data = decodedData['data'];
        final newCategories = data.map((e) => Category.fromJson(e)).toList();
        categories.addAll(newCategories);
        // for (var item in data) {
        //   categories.add(Category.fromJson(item));
        // }
        categories.forEach((element) => print(element.name));
      } else {
        print(
            'Error Status: ${response.statusCode}\nError Message: ${response.body}');
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
    isCategoryLoading = false;
  }

  Future<void> getProducts() async {
    try {
      isProductLoading = true;
      notifyListeners();

      final response = await http.get(Uri.parse(kEndPointUrl + 'products'));
      if (response.statusCode == 200) {
        final decodedDate = jsonDecode(response.body);
        final List data = decodedDate['data'];
        final newProducts = data.map((e) => Product.fromJson(e)).toList();
        products.addAll(newProducts);
      } else {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
    isProductLoading = false;
    notifyListeners();
  }
}
