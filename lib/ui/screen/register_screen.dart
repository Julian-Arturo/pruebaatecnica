import 'package:flutter/material.dart';
import 'package:prueba_tecnica/domain/Models/formRegister.dart';
import 'package:prueba_tecnica/ui/widget/background.dart';
import 'package:prueba_tecnica/ui/widget/line_pass.dart';

class RegiterScreen extends StatelessWidget {
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
        child: Stack(children: [
          const Background(),
          ListView(children: [
            const SizedBox(
              height: 100,
            ),
            const Center(child: FormFieldReg()),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: const RedirectiontoLogin())
                ]),
              ],
            )
          ]),
        ]),
      ),
    );
  }
}
