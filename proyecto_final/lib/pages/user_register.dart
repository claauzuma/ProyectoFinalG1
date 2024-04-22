import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
import 'package:flutter/material.dart';
import 'package:proyecto_final/auth.dart';
import 'package:proyecto_final/entities/user.dart';
import 'package:proyecto_final/services/database_sevice.dart';

class UserRegister extends StatelessWidget {
  UserRegister({Key? key}) : super(key: key);
  static const String name = 'UserRegister';

  final DatabaseService _databaseService = DatabaseService();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerSurname = TextEditingController();
  String? userMail = FirebaseAuth.FirebaseAuth.instance.currentUser?.email;

  String? errorMessage = '';

  Widget _entryField(String title, TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: title == "Contraseña",
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }


  Widget _title() {
    return const Text(
      'Registro de Usuario',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

<<<<<<< HEAD
 Widget _submitButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      User user = User(
        nombre: _controllerName.text,
        apellido: _controllerSurname.text,
        email: userMail,
      );
      _databaseService.addUsuario(user).then((addedSuccessfully) {
        if (!addedSuccessfully) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text('No se pudo agregar el usuario'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Cerrar la ventana emergente
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      }).catchError((error) {
        print('Error al agregar el usuario: $error');
        // Aquí puedes manejar cualquier error que ocurra durante la llamada a addUsuario
      });
    },
    child: Text('Confirmar'),
  );
}
=======
  Widget _submitButton() {
    return ElevatedButton(
      onPressed: () {
        User user = User(
          nombre: _controllerName.text,
          apellido: _controllerSurname.text,
          email: userMail,
        );
        _databaseService.addUser(user);
      },
      child: Text('Confirmar'),
    );
  }
>>>>>>> b7435a06f81ef411e8e2028fe231390c65e55611

  Widget _errorMessage() {
    return Text(
      errorMessage == '' ? '' : '¡Ups! $errorMessage',
      style: TextStyle(
        color: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
 

    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFAF0050),
              Color(0x00EF5350),
            ],
            begin: Alignment.topCenter,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'REGISTRO DE USUARIO',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            _entryField('Nombre', _controllerName),
            const SizedBox(height: 20),
            _entryField('Apellido', _controllerSurname),
            const SizedBox(height: 20),
            _errorMessage(),
            const SizedBox(height: 20),
            _submitButton(context),
          ],
        ),
      ),
    );
  }
}