import 'package:flutter/material.dart';
import 'reservar_cita_screen.dart';
import 'package:elitestyle_app/screens/login_screen.dart'; // Asegúrate de que esta importación esté bien
import 'package:elitestyle_app/screens/register_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reservar Citas',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/reservar': (context) => ReservarCitaScreen(),
      },
    );
  }
}
