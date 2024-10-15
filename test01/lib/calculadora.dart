import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Básica',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  double _result = 0;

  void _calcular(String operaciones) {
    setState(() {
      double numero1 = double.tryParse(_controller.text) ?? 0;
      double numero2 = double.tryParse(_controller2.text) ?? 0;

      switch (operaciones) {
        case '+':
          _result = numero1 + numero2;
          break;
        case '-':
          _result = numero1 - numero2;
          break;
        case '*':
          _result = numero1 * numero2;
          break;
        case '/':
          _result = numero1 / numero2; 
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora Básica'),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Primer numero',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller2,
              decoration: const InputDecoration(
                labelText: 'Segundo numero',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _calcular('+'),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _calcular('-'),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _calcular('*'),
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => _calcular('/'),
                  child: const Text('/'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Resultado: $_result',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall, 
            ),
          ],
        ),
      ),
    );
  }
}
