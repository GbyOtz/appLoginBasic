import 'package:flutter/material.dart';
import 'login.dart';//se importa el login

void main() {//funcion para que la aplicacion se ejecute
  runApp(MyApp());
}

class MyApp extends StatelessWidget {//contiene toda la aplicacion
  @override
  Widget build(BuildContext context) {//se hace la llamada al login
    return MaterialApp(
      title: 'Login',
      home: LoginPage(), 
    );
  }
}
