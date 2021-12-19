import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constants.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
import 'package:flutter_ecommerce_app/screens/screens.dart';
import 'package:http/http.dart' as http; // alias name

class UserProvider extends ChangeNotifier {
  bool hidePassword = true;
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  String username = '', password = '';
  late User currentUser;

  Future<void> login(BuildContext context) async {
    try {
      FocusScope.of(context).unfocus(); // Hide Keyboard
      isLoading = !isLoading;
      notifyListeners();
      if (formKey.currentState != null) {
        formKey.currentState!.save();
        if (formKey.currentState!.validate()) {
          final response = await http.post(
            Uri.parse(kEndPointUrl + 'users/login'),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({
              'username': username,
              'password': password,
            }),
          );

          if (response.statusCode == 200) {
            final decodedData = jsonDecode(response.body);
            currentUser = User.fromJson(decodedData);
            Navigator.popAndPushNamed(context, HomeScreen.id);
          } else {
            final decodedData = jsonDecode(response.body);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(decodedData['message'])),
            );
          }
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }

    isLoading = !isLoading;
    notifyListeners();
  }
}
