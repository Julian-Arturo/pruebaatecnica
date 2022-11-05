import 'package:flutter/material.dart';
import 'package:prueba_tecnica/ui/widget/widgets.dart';

class RegiterScreen extends StatelessWidget {
  const RegiterScreen({Key? key}) : super(key: key);

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
          const BackgroundF(),
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
                      padding: const EdgeInsets.only(top: 50, bottom: 30),
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
