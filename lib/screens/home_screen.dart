import 'package:flutter/material.dart';
import 'citas_reservadas_screen.dart'; // Importa CitasReservadasScreen

class HomeScreen extends StatelessWidget {
  // Lista de citas reservadas (esto debería venir de algún lugar, como el estado global o alguna otra pantalla)
  final List<String> appointments = [
    'Cita 1: 12/09/2023 a las 10:00 AM',
    'Cita 2: 13/09/2023 a las 11:00 AM',
    'Cita 3: 14/09/2023 a las 12:00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla de Inicio'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navegando hacia la pantalla de citas reservadas, pasando la lista de citas
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CitasReservadasScreen(
                  appointments: appointments, // Pasa la lista de citas aquí
                ),
              ),
            );
          },
          child: Text('Ver Citas Reservadas'),
        ),
      ),
    );
  }
}
