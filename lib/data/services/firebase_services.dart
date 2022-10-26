import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:prueba_tecnica/core/utils/showSnackBar.dart';
import 'package:prueba_tecnica/firebase_options.dart';

class FirebaseServices {
  static const String TAG = "loginGoogle";
  static late FirebaseAuth auth;
  static late FirebaseFirestore db;
  static late FirebaseApp firebaseApp;
  static late BuildContext context;
  static late GoogleSignIn googleSignIn = GoogleSignIn();

  static Future<void> initServices() async {
    firebaseApp = await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    auth = FirebaseAuth.instanceFor(app: firebaseApp);
    db = FirebaseFirestore.instanceFor(app: firebaseApp);
  }

  static Future<void> signUpWhitEmail(
      {required String last_name,
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
          "last_name": last_name
        });
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

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
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Verificación de correo enviada');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
