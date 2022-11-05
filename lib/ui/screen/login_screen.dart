import 'package:flutter/material.dart';
import 'package:prueba_tecnica/core/utils/utils.dart';
import 'package:prueba_tecnica/ui/widget/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiUtils utils = UiUtils();
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          final FocusScopeNode focus = FocusScope.of(context);
          if (!focus.hasPrimaryFocus && focus.hasFocus) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: Stack(
          children: [
            const BackgroundF(),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: utils.screenSize.height * 0.2,
                  ),
                  const Center(child: FormFieldLog()),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                padding:
                                    const EdgeInsets.only(top: 50, bottom: 60),
                                child: const RedirectiontoRegister())
                          ]),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
