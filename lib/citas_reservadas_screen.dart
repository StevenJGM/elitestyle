// citas_reservadas_screen.dart
import 'package:flutter/material.dart';
import 'reservar_cita_screen.dart';

class CitasReservadasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var citas = ReservarCitaScreen.citasReservadas;

    return Scaffold(
      appBar: AppBar(title: Text("Citas Reservadas")),
      body: citas.isEmpty
          ? Center(child: Text("No hay citas reservadas"))
          : ListView.builder(
              itemCount: citas.length,
              itemBuilder: (context, index) {
                var cita = citas[index];
                return ListTile(
                  title: Text("${cita.fecha} a las ${cita.hora}"),
                );
              },
            ),
    );
  }
}
