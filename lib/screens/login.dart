import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/main.dart';
import 'package:flutter_ecommerce_app/providers/providers.dart';
import 'package:flutter_ecommerce_app/screens/home.dart';
import 'package:flutter_ecommerce_app/widgets/social_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String id = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserProvider>(
        builder: (context, value, _) => ModalProgressHUD(
          inAsyncCall: value.isLoading,
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 36),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Back,',
                            style: GoogleFonts.poppins(
                              color: Colors.black87,
                              fontSize: 24,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            'Dear User',
                            style: GoogleFonts.montserrat(
                              color: Theme.of(context).primaryColor,
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Form(
                      key: value.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.only(left: 16, right: 16),
                            child: Center(
                              child: TextFormField(
                                validator: (value) {
                                  if (value != null) {
                                    if (value.isEmpty) return 'Field required';
                                    if (value.length < 3)
                                      return 'Invalid Username Length';
                                  }
                                },
                                onSaved: (newValue) {
                                  if (newValue != null) {
                                    value.username = newValue;
                                  }
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelText: 'Username',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            margin: EdgeInsets.only(left: 16, right: 16),
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: TextFormField(
                                validator: (value) {
                                  if (value != null) {
                                    if (value.isEmpty) return 'Field required';
                                    if (value.length < 3)
                                      return 'Invalid Password Length';
                                  }
                                },
                                onSaved: (newValue) {
                                  if (newValue != null) {
                                    value.username = newValue;
                                  }
                                },
                                obscureText: value.hidePassword,
                                decoration: InputDecoration(
                                  suffix: GestureDetector(
                                    child: Icon(value.hidePassword
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onTap: () => setState(() => value
                                        .hidePassword = !value.hidePassword),
                                  ),
                                  labelText: 'Password',
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: 16, right: 16, top: 10),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot Password ?',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            margin: EdgeInsets.only(left: 16, right: 16),
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: value.login,
                              child: Text(
                                'Log In',
                                style: GoogleFonts.poppins(fontSize: 20),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        'Or Login With',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialIconButton(
                          icon: Icon(
                            FontAwesomeIcons.google,
                            color: Colors.deepOrange,
                          ),
                          onPressed: () {},
                        ),
                        const SizedBox(width: 10),
                        SocialIconButton(
                          icon: Icon(
                            FontAwesomeIcons.facebookF,
                            color: Colors.blue,
                          ),
                          onPressed: () {},
                        ),
                        const SizedBox(width: 10),
                        SocialIconButton(
                          icon: Icon(FontAwesomeIcons.sms, color: Colors.black),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            'Not a member ?',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        TextButton(onPressed: () {}, child: Text('Join Now'))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
