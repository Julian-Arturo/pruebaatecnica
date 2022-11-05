import 'package:flutter/material.dart';
import 'package:prueba_tecnica/core/utils/ui_utils.dart';
import 'package:prueba_tecnica/data/services/firebase_services.dart';
import 'package:prueba_tecnica/ui/screen/screens.dart';
import 'package:prueba_tecnica/ui/widget/widgets.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreen();
}

class _ChangePasswordScreen extends State<ChangePasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  void _changePasswordReset() async {
    FirebaseServices.changePassword(
      email: emailController.text,
      context: context,
    );
  }

  final UiUtils _uiUtils = UiUtils();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          final FocusScopeNode focus = FocusScope.of(context);
          if (!focus.hasPrimaryFocus && focus.hasFocus) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: Center(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              const BackgroundF(),
              Container(
                height: _uiUtils.screenSize.height * 0.4,
                padding: const EdgeInsets.all(10),
                width: _uiUtils.screenSize.width * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color(0xffD9D9D9)),
                child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Recupera tu contraseña',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          width: _uiUtils.screenSize.height * 0.3,
                          child: CustomTextField(
                              controller: emailController,
                              hintText: 'Email',
                              sizeW: _uiUtils.screenSize.width * 0.4)),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06),
                      ButtonsStyle(
                        backgroundColor: const Color(
                          0xff0FB8C2,
                        ),
                        onPressed: () {
                          _changePasswordReset();
                          Navigator.of(context).pop();
                        },
                        sizeH: 40,
                        sizeW: 140,
                        text: 'Recuperar',
                        textColor: Colors.white,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ]),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonsStyle(
                          textColor: Colors.white,
                          backgroundColor: const Color(0xff0FB8C2),
                          text: 'Inicio',
                          sizeW: 100,
                          sizeH: 40,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const SplashScreen()));
                          })
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
