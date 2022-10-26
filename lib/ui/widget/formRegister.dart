// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:prueba_tecnica/core/utils/ui_utils.dart';
import 'package:prueba_tecnica/data/services/firebase_services.dart';
import 'package:prueba_tecnica/domain/Models/google_SignIn.dart';
import 'package:prueba_tecnica/domain/Models/facebook.dart';
import 'package:prueba_tecnica/ui/screen/map_screen.dart';
import 'package:prueba_tecnica/ui/widget/custom_textfield.dart';
import 'package:prueba_tecnica/ui/widget/button.dart';
import 'package:prueba_tecnica/ui/widget/line_pass.dart';
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

  void signUpUser() async {
    FirebaseServices.signUpWhitEmail(
      last_name: last_nameController.text,
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    UiUtils _utils = UiUtils();
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: _utils.screenSize.width * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: const Color(0xffD9D9D9)),
        child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const TextScrenRegister(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              CustomTextField(
                controller: nameController,
                hintText: 'Nombre',
                sizeW: 250,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: last_nameController,
                hintText: 'Apellido',
                sizeW: 250,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: emailController,
                hintText: 'Correo',
                sizeW: 250,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: passwordController,
                hintText: 'Contraseña',
                sizeW: 250,
              ),
              const SizedBox(height: 30),
              ButtonsStyle(
                  backgroundColor: const Color(
                    0xff0FB8C2,
                  ),
                  onPressed: () {
                    setState(() {
                      signUpUser();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const MapScreen()));
                    });
                  },
                  sizeH: 45,
                  sizeW: _utils.screenSize.width * 0.5,
                  text: 'REGISTRARSE',
                  textColor: Colors.white),
              const SizedBox(
                height: 20,
              ),
              const Line(text: "Registrate también con"),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  const GoogleSinIn1(),
                  const FacebookSignIn()
                ],
              )
            ]),
      ),
    );
  }
}
