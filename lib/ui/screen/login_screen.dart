import 'package:flutter/material.dart';
import 'package:prueba_tecnica/core/utils/ui_utils.dart';
import 'package:prueba_tecnica/ui/widget/formLogin.dart';
import 'package:prueba_tecnica/ui/widget/background.dart';
import 'package:prueba_tecnica/ui/widget/line_pass.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UiUtils _utils = UiUtils();
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
            const Background(),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: _utils.screenSize.height * 0.2,
                  ),
                  const Center(child: EmailAndPasswordLogin()),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                padding: const EdgeInsets.only(bottom: 30),
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
