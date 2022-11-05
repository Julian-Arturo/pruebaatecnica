import 'package:flutter/material.dart';
import 'package:prueba_tecnica/core/utils/ui_utils.dart';
import 'package:prueba_tecnica/ui/screen/screens.dart';
import 'package:prueba_tecnica/ui/widget/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    UiUtils uiUtils = UiUtils();

    setUiSize(context);
    return Scaffold(
      body: Stack(alignment: AlignmentDirectional.center, children: [
        const BackgroundF(),
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
                height: uiUtils.screenSize.height * 0.1,
              ),
              Hero(
                tag: 1,
                child: Container(
                  padding: EdgeInsets.only(bottom: 60),
                  child: ButtonsStyle(
                    backgroundColor: const Color(0xff0FB8C2),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const LoginScreen()));
                    },
                    sizeH: 60,
                    sizeW: uiUtils.screenSize.width * 0.8,
                    text: 'START',
                    textColor: Colors.white,
                  ),
                ),
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
