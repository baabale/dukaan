import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  bool hidePassword = true;
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  String username = '', password = '';

  void login() {
    isLoading = !isLoading;
    notifyListeners();
    if (formKey.currentState != null) {
      formKey.currentState!.save();
      if (formKey.currentState!.validate()) {
        // Navigator.popAndPushNamed(context, HomeScreen.id);
      }
    }
    isLoading = !isLoading;
    notifyListeners();
  }
}
