import 'package:flutter/material.dart';
import 'package:prueba_tecnica/core/utils/ui_utils.dart';
import 'package:prueba_tecnica/ui/screen/screens.dart';
import 'package:prueba_tecnica/ui/widget/background.dart';
import 'package:prueba_tecnica/ui/widget/button.dart';
import 'package:prueba_tecnica/ui/widget/circle_Avatar.dart';
import 'package:prueba_tecnica/ui/widget/text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiUtils _uiUtils = UiUtils();

    setUiSize(context);
    return Scaffold(
      body: Stack(children: [
        const Background(),
        SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                  alignment: AlignmentDirectional.center,
                  children: const [Avatar(), FondoAvatar()]),
              const SizedBox(
                height: 60,
              ),
              const TextScreen(),
              SizedBox(
                height: _uiUtils.screenSize.height * 0.1,
              ),
              ButtonsStyle(
                backgroundColor: const Color(0xff0FB8C2),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => LoginScreen()));
                },
                sizeH: 60,
                sizeW: _uiUtils.screenSize.width * 0.8,
                text: 'START',
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ]),
    );
  }

  void setUiSize(BuildContext context) {
    UiUtils uiUtils = UiUtils();
    Size size = MediaQuery.of(context).size;
    uiUtils.screenSize.height = size.height;
    uiUtils.screenSize.width = size.width;
    uiUtils.screenSize.absoluteHeight =
        size.height - MediaQuery.of(context).viewPadding.top;
  }
}
