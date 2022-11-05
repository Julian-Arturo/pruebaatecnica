// ignore
import 'package:flutter/material.dart';
import 'package:prueba_tecnica/core/utils/ui_utils.dart';
import 'package:prueba_tecnica/data/services/firebase_services.dart';
import 'package:prueba_tecnica/domain/Models/google_SignIn.dart';
import 'package:prueba_tecnica/domain/Models/facebook.dart';

import 'package:prueba_tecnica/ui/widget/custom_textfield.dart';
import 'package:prueba_tecnica/ui/widget/button.dart';
import 'package:prueba_tecnica/ui/widget/line_pass.dart';
import 'package:prueba_tecnica/ui/widget/loading.dart';
import 'package:prueba_tecnica/ui/widget/text.dart';

class FormFieldLog extends StatefulWidget {
  const FormFieldLog({Key? key}) : super(key: key);

  @override
  State<FormFieldLog> createState() => _FormFieldLogState();
}

class _FormFieldLogState extends State<FormFieldLog> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void loginUser() async {
    Loading.loadingCircle(context: context);
    FirebaseServices.signInEmail(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
    Navigator.of(context).pop();
  }

  final UiUtils _uiUtils = UiUtils();

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
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: emailController,
                hintText: 'Correo',
                sizeW: _uiUtils.screenSize.width * 0.65,
              ),
              SizedBox(
                height: _uiUtils.screenSize.height * 0.030,
              ),
              CustomTextField(
                controller: passwordController,
                hintText: 'Contraseña',
                sizeW: _uiUtils.screenSize.width * 0.65,
              ),
              SizedBox(height: _uiUtils.screenSize.height * 0.06),
              Hero(
                tag: 1,
                child: ButtonsStyle(
                  backgroundColor: const Color(
                    0xff0FB8C2,
                  ),
                  onPressed: () async {
                    loginUser();
                  },
                  sizeH: 40,
                  sizeW: _uiUtils.screenSize.width * 0.5,
                  text: 'LOGIN',
                  textColor: Colors.white,
                ),
              ),
              SizedBox(
                height: _uiUtils.screenSize.height * 0.03,
              ),
              const ForgotPasssword(),
              SizedBox(
                height: _uiUtils.screenSize.height * 0.03,
              ),
              const Line(text: 'Ingresa también con'),
              SizedBox(
                height: _uiUtils.screenSize.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Hero(
                    tag: 2,
                    child: GoogleSinIn1(),
                  ),
                  Hero(tag: 3, child: FacebookSignIn())
                ],
              )
            ]),
      ),
    );
  }
}
