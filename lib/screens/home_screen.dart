import 'package:flutter/material.dart';
import '../reservar_cita_screen.dart';
import '../citas_reservadas_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Peluquería")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReservarCitaScreen()),
                );
              },
              child: Text("Reservar cita"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CitasReservadasScreen()),
                );
              },
              child: Text("Ver citas reservadas"),
            ),
          ],
        ),
      ),
    );
  }
}
