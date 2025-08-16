import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:elitestyle_app/screens/citas_reservadas_screen.dart'; // Asegúrate de tener esta importación

class ReservarCitaScreen extends StatefulWidget {
  @override
  _ReservarCitaScreenState createState() => _ReservarCitaScreenState();
}

class _ReservarCitaScreenState extends State<ReservarCitaScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? formattedDate;
  String? formattedTime;
  List<String> reservedAppointments = [];

  // Método para seleccionar la fecha
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        formattedDate = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  // Método para seleccionar la hora
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        formattedTime = selectedTime!.format(context);
      });
    }
  }

  // Método para agregar la cita a la lista de citas
  void _addAppointment() {
    if (formattedDate != null && formattedTime != null) {
      setState(() {
        reservedAppointments.add('Cita: $formattedDate a las $formattedTime');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservar Cita'),
        backgroundColor: Colors.teal, // Cambia el color del AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Título
              Text(
                'Reserva tu cita',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              // Tarjeta para seleccionar la fecha
              Card(
                elevation: 5,
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  title: Text('Selecciona la fecha',
                      style: TextStyle(fontSize: 18)),
                  subtitle: Text(formattedDate ?? 'Fecha no seleccionada',
                      style: TextStyle(fontSize: 16)),
                  trailing: Icon(Icons.calendar_today, color: Colors.teal),
                  onTap: () => _selectDate(context),
                ),
              ),
              SizedBox(height: 20),

              // Tarjeta para seleccionar la hora
              Card(
                elevation: 5,
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  title: Text('Selecciona la hora',
                      style: TextStyle(fontSize: 18)),
                  subtitle: Text(formattedTime ?? 'Hora no seleccionada',
                      style: TextStyle(fontSize: 16)),
                  trailing: Icon(Icons.access_time, color: Colors.teal),
                  onTap: () => _selectTime(context),
                ),
              ),
              SizedBox(height: 40),

              // Botón para agregar la cita
              ElevatedButton(
                onPressed: () {
                  if (formattedDate != null && formattedTime != null) {
                    _addAppointment();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Cita reservada exitosamente!')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Por favor, selecciona fecha y hora.')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.teal, // Cambié "primary" a "backgroundColor"
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Agendar Cita', style: TextStyle(fontSize: 18)),
              ),

              // Botón para ver citas reservadas
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CitasReservadasScreen(
                        appointments: reservedAppointments,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.blueAccent, // Cambié "primary" a "backgroundColor"
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Ver Citas Reservadas',
                    style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
