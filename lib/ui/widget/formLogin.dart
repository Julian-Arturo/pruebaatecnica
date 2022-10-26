// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica/core/utils/ui_utils.dart';
import 'package:prueba_tecnica/data/services/firebase_services.dart';
import 'package:prueba_tecnica/domain/Models/google_SignIn.dart';
import 'package:prueba_tecnica/domain/Models/facebook.dart';

import 'package:prueba_tecnica/ui/widget/custom_textfield.dart';
import 'package:prueba_tecnica/ui/widget/button.dart';
import 'package:prueba_tecnica/ui/widget/line_pass.dart';
import 'package:prueba_tecnica/ui/widget/text.dart';

class EmailAndPasswordLogin extends StatefulWidget {
  const EmailAndPasswordLogin({Key? key}) : super(key: key);

  @override
  State<EmailAndPasswordLogin> createState() => _EmailAndPasswordLoginState();
}

class _EmailAndPasswordLoginState extends State<EmailAndPasswordLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void loginUser() async {
    FirebaseServices.signInEmail(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
  }

  // void signInWithGoogle() {
  //   FirebaseServices.signInWithGoogle();
  // }

  // ignore: prefer_final_fields
  UiUtils _uiUtils = UiUtils();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: _uiUtils.screenSize.width * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: const Color(0xffD9D9D9)),
        child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const TextScrrenLogin(),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: emailController,
                hintText: 'Correo',
                sizeW: 250,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: passwordController,
                hintText: 'Contraseña',
                sizeW: 250,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),
              ButtonsStyle(
                backgroundColor: Color(
                  0xff0FB8C2,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  loginUser();
                  setState(() {});
                },
                sizeH: 40,
                sizeW: 150,
                text: 'LOGIN',
                textColor: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              const ForgotPasssword(),
              SizedBox(
                height: 10,
              ),
              const Line(text: 'Ingresa también con'),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  GoogleSinIn1(),
                  FacebookSignIn()
                ],
              )
            ]),
      ),
    );
  }
}
