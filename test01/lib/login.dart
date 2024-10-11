import 'package:flutter/material.dart'; //importamos una libreria fundamental para desarrollar con flutter
import 'calculadora.dart';//importamos el otro archivo para visualizar despues de iniciar sesion

class LoginPage extends StatefulWidget {//creamos la clase LoginPage
  @override
  _LoginPageState createState() => _LoginPageState();//creamos una instancia de la clase que se asocia a loginpagestate
}

class _LoginPageState extends State<LoginPage> {//aqui se define la logica que se manejara y la inetrfaz
  final String defaultUsuario = 'Gaby';//usuario y contraseña estaticos
  final String defaultContra = 'gato789';

  final TextEditingController _usuarioController = TextEditingController();//los controladores nos ayudan a acceder al texto que ingresa el usuario
  final TextEditingController _contraController = TextEditingController();

  void _login() {//esta funcion se ejecutara cuando se inicie sesion
    String usuario = _usuarioController.text; //creamos variable que guarde el texto que ingresara el usuario
    String contra = _contraController.text;

    if (usuario == defaultUsuario && contra == defaultContra) {
      Navigator.push(//este es un metodo de busqueda en flutter que redirigira a la calculadora
        context,
        MaterialPageRoute(builder: (context) => MyApp()),//crear una nueva ruta y muestra la calculadora
      );
    } else {//si las credenciales estan mal se muestra un modal que señala el error
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Usuario o contraseña incorrectos'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {//este metodo es fundamental para construir la interfaz
    return Scaffold(//este metodo brinda una estructura basica 
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(//se detalla como sera el cuerpo de la aplicacion, es similar a realizar un css
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usuarioController,
              decoration: InputDecoration(labelText: 'Usuario'),
            ),
            TextField(
              controller: _contraController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Iniciar sesión'),
              onPressed: _login,
            ),
          ],
        ),
      ),
    );
  }
}
