// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/data/services/firebase_auth.dart';
import 'package:prueba_tecnica/domain/Models/facebook%20copy.dart';
import 'package:prueba_tecnica/domain/Models/facebook.dart';
import 'package:prueba_tecnica/domain/Models/google.dart';
import 'package:prueba_tecnica/domain/Models/widget/custom_textfield.dart';
import 'package:prueba_tecnica/ui/widget/button.dart';
import 'package:prueba_tecnica/ui/widget/line_pass.dart';
import 'package:prueba_tecnica/ui/widget/text.dart';

class FormFieldReg extends StatefulWidget {
  const FormFieldReg({Key? key}) : super(key: key);

  @override
  State<FormFieldReg> createState() => _FormFieldRegState();
}

class _FormFieldRegState extends State<FormFieldReg> {
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
    FirebaseAuthEmailAndPassword(FirebaseAuth.instance).signUpWhitEmail(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 300,
        height: 500,
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),
              ButtonsStyle(
                  backgroundColor: Color(
                    0xff0FB8C2,
                  ),
                  onPressed: () {},
                  sizeH: 40,
                  sizeW: 170,
                  text: 'REGISTRARSE',
                  textColor: Colors.white),
              const Line(text: "Registrate también con"),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  GoogleSinIn1(),
                  const SizedBox(
                    width: 30,
                  ),
                  FacebookSignIn()
                ],
              )
            ]),
      ),
    );
  }
}
