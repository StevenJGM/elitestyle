// main.dart
import 'package:flutter/material.dart';
import 'reservar_cita_screen.dart';
import 'login_screen.dart';
import 'package:elitestyle_app/screens/register_screen.dart';
import 'screens/citas_reservadas_screen.dart'; // Importa la nueva pantalla de citas

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
        '/citas_reservadas': (context) =>
            CitasReservadasScreen(appointments: []), // Ruta para las citas
      },
    );
  }
}


/// usuario@ejemplo.com  
/// 123456