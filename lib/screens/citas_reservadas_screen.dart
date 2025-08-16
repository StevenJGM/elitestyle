import 'package:flutter/material.dart';

class CitasReservadasScreen extends StatelessWidget {
  final List<String> appointments; // Lista de citas

  // Constructor con parámetro 'appointments'
  CitasReservadasScreen({required this.appointments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Citas Reservadas"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Título principal
            Text(
              'Tus Citas Reservadas',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Verificar si hay citas
            appointments.isEmpty
                ? Center(
                    child: Text('No tienes citas reservadas aún.',
                        style: TextStyle(fontSize: 18, color: Colors.grey)))
                : Expanded(
                    child: ListView.builder(
                      itemCount: appointments.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 5,
                          margin: EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(16),
                            leading: Icon(Icons.event, color: Colors.teal),
                            title: Text(
                              appointments[index],
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('Cita reservada con éxito',
                                style: TextStyle(fontSize: 14)),
                            trailing: IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                // Función para eliminar la cita
                                // Puedes agregar una lógica para eliminar la cita
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: Text("Eliminar Cita"),
                                    content: Text(
                                        "¿Estás seguro de que quieres eliminar esta cita?"),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          // Lógica para eliminar la cita
                                          Navigator.pop(
                                              context); // Cierra el dialogo
                                        },
                                        child: Text("Sí"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(
                                              context); // Cierra el dialogo
                                        },
                                        child: Text("No"),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
