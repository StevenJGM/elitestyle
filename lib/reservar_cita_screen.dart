// reservar_cita_screen.dart
import 'package:flutter/material.dart';
import 'screens/cita.dart';
import 'citas_reservadas_screen.dart';

class ReservarCitaScreen extends StatefulWidget {
  static List<Cita> citasReservadas = [];

  @override
  _ReservarCitaScreenState createState() => _ReservarCitaScreenState();
}

class _ReservarCitaScreenState extends State<ReservarCitaScreen> {
  final TextEditingController fechaController = TextEditingController();
  final TextEditingController horaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reservar Cita")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Selección de fecha
            TextField(
              controller: fechaController,
              readOnly: true,
              decoration: InputDecoration(labelText: "Fecha"),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  fechaController.text =
                      "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
                }
              },
            ),

            // Selección de hora
            TextField(
              controller: horaController,
              readOnly: true,
              decoration: InputDecoration(labelText: "Hora"),
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (pickedTime != null) {
                  horaController.text =
                      "${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}";
                }
              },
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                if (_validarHora()) {
                  ReservarCitaScreen.citasReservadas.add(
                    Cita(
                      fecha: fechaController.text,
                      hora: horaController.text,
                    ),
                  );
                  fechaController.clear();
                  horaController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Cita reservada con éxito")),
                  );
                }
              },
              child: Text("Guardar Cita"),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CitasReservadasScreen()),
                );
              },
              child: Text("Ver Citas Reservadas"),
            ),
          ],
        ),
      ),
    );
  }

  // Método para validar hora
  bool _validarHora() {
    if (fechaController.text.isEmpty || horaController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Debe seleccionar fecha y hora")),
      );
      return false;
    }

    DateTime fechaSeleccionada = DateTime.parse(fechaController.text);
    List<String> partesHora = horaController.text.split(":");
    int hora = int.parse(partesHora[0]);
    int minuto = int.parse(partesHora[1]);

    DateTime fechaHoraSeleccionada = DateTime(
      fechaSeleccionada.year,
      fechaSeleccionada.month,
      fechaSeleccionada.day,
      hora,
      minuto,
    );

    if (fechaHoraSeleccionada.isBefore(DateTime.now())) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("La hora seleccionada ya ha pasado")),
      );
      return false;
    }

    return true;
  }
}
