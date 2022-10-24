import 'package:flutter/material.dart';
import 'package:prueba_tecnica/ui/screen/screens.dart';
import 'package:prueba_tecnica/ui/widget/button.dart';

class Line extends StatelessWidget {
  final String text;
  const Line({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.grey,
            width: 50,
            height: 1,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(color: Colors.grey, width: 50, height: 1)
        ],
      ),
    );
  }
}

//Olvie mi contraseña, recuperacion de contraseña.

class ForgotPasssword extends StatelessWidget {
  const ForgotPasssword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: const Text(
              'Olvidaste tu contraseña?',
              style: TextStyle(fontSize: 10),
            )),
      ],
    );
  }
}

//Redireccionamiento para registarse

class RedirectiontoRegister extends StatelessWidget {
  const RedirectiontoRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "¿No tienes aún cuenta?",
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
        BtnRedirection(
            text: 'Registarte aquí',
            onpressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => RegiterScreen()));
            })
      ],
    );
  }
}

//Redireccion para iniciar sesion
class RedirectiontoLogin extends StatelessWidget {
  const RedirectiontoLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "¿Ya tienes cuenta?",
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
        BtnRedirection(
            text: 'Ingresa Aquí',
            onpressed: () {
              Navigator.pop(
                  context, MaterialPageRoute(builder: (_) => LoginScreen()));
            })
      ],
    );
  }
}
