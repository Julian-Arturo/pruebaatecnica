import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:prueba_tecnica/core/utils/showSnackBar.dart';
import 'package:prueba_tecnica/firebase_options.dart';
import 'package:prueba_tecnica/ui/screen/screens.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FirebaseServices {
  static late FirebaseAuth auth;
  static late FirebaseFirestore db;
  static late FirebaseApp firebaseApp;
  static late BuildContext context;
  static GoogleSignIn googleSignIn = GoogleSignIn();

  FirebaseServices(FirebaseAuth instance);

  static Future<void> initServices() async {
    firebaseApp = await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    auth = FirebaseAuth.instanceFor(app: firebaseApp);
    db = FirebaseFirestore.instanceFor(app: firebaseApp);
  }

  //**Registro con correo y contraseña */
  static Future<void> signUpWhitEmail(
      {required String lastName,
      required String name,
      required String email,
      required String password,
      required BuildContext context}) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        await db.collection("user").doc(credential.user!.uid).set({
          "register_date": DateTime.now(),
          "name": name,
          "email": email,
          "last_name": lastName
        });
      }

      if (credential.user != null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => const MapScreen()),
            (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  //**Login con correo y contraseña */
  static Future<void> signInEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        await db.collection("user").doc(credential.user!.uid).get();
      }

      if (credential.user != null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => const MapScreen()),
            (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  //**Verificacion de correo electronico */
  static Future<void> sendEmailVerification(BuildContext context) async {
    try {
      auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Verificación de correo enviada');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  //*Login con Google */
  static Future signInWithGoogle(BuildContext context) async {
    final _googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleSignInAccount?.authentication;

      AuthCredential credential = GoogleAuthProvider?.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      User? user = userCredential.user;

      //Verificación de un usuario existente
      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          await db.collection('user').doc(user.uid).set({
            'email': user.email,
            'register_date': DateTime.now(),
            'name': user.displayName,
            'uid': user.uid,
            'profilePhoto': user.photoURL,
          });
        }
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => const MapScreen()),
            (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  //**Cambio de contraseña
  static Future changePassword(
      {required BuildContext context, required String email}) async {
    try {
      auth.sendPasswordResetEmail(email: email);
      showSnackBar(
          context, 'Hemos enviado un correo para recuperar su contraseña');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  //* Login con Facebook*/

  static Future<User?> loginWithFacebook(BuildContext context) async {
    try {
      final LoginResult facebookAuth = await FacebookAuth.instance.login();

      if (facebookAuth.accessToken != null) {
        final AuthCredential credential = await FacebookAuthProvider.credential(
            facebookAuth.accessToken!.token);
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        User? user = userCredential.user;

        if (user != null) {
          await FirebaseFirestore.instance
              .collection('user')
              .doc(user.uid)
              .set({
            'email': user.email,
            'register_date': DateTime.now(),
            'name': user.displayName,
            'uid': user.uid,
            'profilePhoto': user.photoURL,
          });
        }
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => const MapScreen()),
            (route) => false);
      } else {
        showSnackBar(
            context, 'Error: No ha iniciado sesion correctamente en facebook');
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
    return null;
  }
}
