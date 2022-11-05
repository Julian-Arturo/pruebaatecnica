import 'package:flutter/material.dart';
import 'package:prueba_tecnica/core/utils/ui_utils.dart';
import 'package:prueba_tecnica/data/services/firebase_services.dart';
import 'package:prueba_tecnica/data/services/services.dart';
import 'package:prueba_tecnica/domain/Models/google_SignIn.dart';
import 'package:prueba_tecnica/domain/Models/facebook.dart';
import 'package:prueba_tecnica/ui/widget/custom_textfield.dart';
import 'package:prueba_tecnica/ui/widget/button.dart';
import 'package:prueba_tecnica/ui/widget/line_pass.dart';
import 'package:prueba_tecnica/ui/widget/loading.dart';
import 'package:prueba_tecnica/ui/widget/text.dart';

class FormFieldReg extends StatefulWidget {
  const FormFieldReg({Key? key}) : super(key: key);

  @override
  State<FormFieldReg> createState() => _FormFieldRegState();
}

class _FormFieldRegState extends State<FormFieldReg> {
  // ignore: non_constant_identifier_names
  final TextEditingController last_nameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  void emailVerification() async {
    FirebaseServices.sendEmailVerification(context);
  }

  void signUpUser() async {
    Loading.loadingCircle(context: context);
    FirebaseServices.signUpWhitEmail(
      lastName: last_nameController.text,
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    UiUtils utils = UiUtils();
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: utils.screenSize.width * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: const Color(0xffD9D9D9)),
        child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const TextScrenRegister(),
              SizedBox(height: utils.screenSize.height * 0.04),
              CustomTextField(
                controller: nameController,
                hintText: 'Nombre',
                sizeW: utils.screenSize.width * 0.65,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: last_nameController,
                hintText: 'Apellido',
                sizeW: utils.screenSize.width * 0.65,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: emailController,
                hintText: 'Correo',
                sizeW: utils.screenSize.width * 0.65,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: passwordController,
                hintText: 'Contraseña',
                sizeW: utils.screenSize.width * 0.65,
              ),
              SizedBox(height: utils.screenSize.height * 0.05),
              Hero(
                tag: 1,
                child: ButtonsStyle(
                    backgroundColor: const Color(
                      0xff0FB8C2,
                    ),
                    onPressed: () {
                      signUpUser();
                      emailVerification();
                    },
                    sizeH: 45,
                    sizeW: utils.screenSize.width * 0.5,
                    text: 'REGISTRARSE',
                    textColor: Colors.white),
              ),
              SizedBox(
                height: utils.screenSize.height * 0.02,
              ),
              const Line(text: "Registrate también con"),
              SizedBox(
                height: utils.screenSize.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Hero(tag: 2, child: GoogleSinIn1()),
                  Hero(tag: 3, child: FacebookSignIn())
                ],
              )
            ]),
      ),
    );
  }
}
