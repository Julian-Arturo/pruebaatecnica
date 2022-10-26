import 'package:flutter/material.dart';
import 'package:prueba_tecnica/app.dart';
import 'package:prueba_tecnica/data/services/firebase_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseServices.initServices();
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const App();
  }
}
