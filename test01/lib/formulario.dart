import 'package:flutter/material.dart';


class Formulario extends StatefulWidget{
    const Formulario ({super.key});
  @override
  _Formulario createState()=> _Formulario();
} 

class _Formulario extends State<Formulario>{
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _aliasController = TextEditingController();
  final TextEditingController _desController = TextEditingController();
  final TextEditingController _lugarController = TextEditingController();

  String? _dirigidoA;
  // Opciones
  final List<String> _opcionesDirigidoA = [
    'Infraestructura',
    'Personal administrativo',
    'Personal de limpieza',
    'Docentes',
    'Otro',
  ];

  DateTime? _fecha;
  //seleccionar fecha
  Future<void> _seleccionarFecha(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2026),
    );
    if (picked != null && picked != _fecha) {
      setState(() {
        _fecha = picked;
      });
    }
  }
  
  void _mostrarDatos(){
     showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Datos Ingresados'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Alias: ${_aliasController.text}'),
                  Text('Destinatario: $_dirigidoA'),
                  Text(
                      'Fecha del Suceso: ${_fecha != null ? _fecha.toString().split(' ')[0] : 'No seleccionada'}'),
                  Text('Lugar: ${_lugarController.text}'),
                  Text('Descripción: ${_desController.text}'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
  }

  void _limpiar(){
    if(_formKey.currentState!.validate()){
      _mostrarDatos();
      _desController.clear();
      _lugarController.clear();
      _aliasController.clear();
      setState(() {
        _dirigidoA = null;
        _fecha = null;
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario'),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _fecha == null
                      ? 'Fecha no seleccionada'
                      : 'Fecha del suceso: ${_fecha.toString().split(' ')[0]}',
                    ),
                  ),
                  ElevatedButton(onPressed:()=> _seleccionarFecha(context), 
                  child: const Text('Seleccionar Fecha de suceso'),),
                ],
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _aliasController,
                decoration: const InputDecoration(labelText: 'Alias'),
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _lugarController,
                decoration: const InputDecoration(labelText: 'Lugar'),
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _desController,
                decoration: const InputDecoration(labelText: 'Descripcion'),
              ),
              const SizedBox(height: 20),

              DropdownButtonFormField<String>(
                value: _dirigidoA,
                decoration: const InputDecoration(labelText: 'A quien va dirigida la queja?'),
              
                items: _opcionesDirigidoA.map((String item){
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (value){
                  setState((){
                    _dirigidoA = value;
                  });
                },
              ),
              const SizedBox(height: 20),

              Center(
                child: ElevatedButton(onPressed: _limpiar, child: const Text('Enviar Queja'),
                  style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12) 
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}