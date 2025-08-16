// login_screen.dart
import 'package:flutter/material.dart';
import 'reservar_cita_screen.dart'; // Importa la pantalla de Reservar Cita

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Correo electrónico'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Datos "quemados" para validar el login
                String email = emailController.text;
                String password = passwordController.text;

                if (email == 'usuario@ejemplo.com' && password == '123456') {
                  // Si los datos son correctos, navega a la pantalla de Reservar Cita
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReservarCitaScreen()),
                  );
                } else {
                  // Si los datos son incorrectos, muestra un error
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Error'),
                      content: Text('Correo o contraseña incorrectos.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Aceptar'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text('Iniciar sesión'),
            ),
            TextButton(
              onPressed: () {
                // Navegar a la pantalla de Crear cuenta
                Navigator.pushNamed(context, '/register');
              },
              child: Text('¿No tienes cuenta? Regístrate'),
            ),
          ],
        ),
      ),
    );
  }
}
