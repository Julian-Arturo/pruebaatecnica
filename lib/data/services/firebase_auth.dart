// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:prueba_tecnica/domain/utils/showSnackBar.dart';

class FirebaseAuthEmailAndPassword {
  final FirebaseAuth _auth;
  FirebaseAuthEmailAndPassword(this._auth);

//METODO PARA REGISTARSE EN LA APLICACIÓN

  Future<void> signUpWhitEmail({
    String? name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
  //METODO PARA INICIAR SESION CON USUARIO REGISTRADO

  Future<void> signInEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (!_auth.currentUser!.emailVerified) {
        await sendEmailVerification(context);
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  //Verificación de correo electronico

  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Verificación de correo enviada');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
}
