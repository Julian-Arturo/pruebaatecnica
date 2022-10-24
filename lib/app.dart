import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/domain/Models/wrapper.dart';

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
        'wrapper': (_) => Wrapper(),
        'splash': (_) => const SplashScreen(),
        'mapa': (_) => MapScreen(),
        'register': (_) => RegiterScreen(),
        'login': (_) => LoginScreen()
      },
      theme: ThemeData(fontFamily: 'KulimPark'),
    );
  }
}
