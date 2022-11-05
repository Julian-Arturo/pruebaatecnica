import 'package:flutter/material.dart';
import 'package:prueba_tecnica/ui/screen/wrapper.dart';
import 'ui/screen/screens.dart';

class App extends StatefulWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba Tecnica',
      initialRoute: 'wrapper',
      routes: {
        'wrapper' : (BuildContext context) => const Wrapper(),
        'splash'  : (BuildContext context) => const SplashScreen(),
        'mapa'    : (BuildContext context) => const MapScreen(),
        'register': (BuildContext context) => const RegiterScreen(),
        'login'   : (BuildContext context) => const LoginScreen()
      },
      theme: ThemeData(fontFamily: 'KulimPark'),
    );
  }
}
