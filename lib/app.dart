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
      initialRoute: 'mapa',
      routes: {
        'wrapper': (_) => Wrapper(),
        'splash': (_) => const SplashScreen(),
        'mapa': (_) => const MapScreen(),
        'register': (_) => RegiterScreen(),
        'login': (_) => LoginScreen()
      },
      theme: ThemeData(fontFamily: 'KulimPark'),
    );
  }
}
