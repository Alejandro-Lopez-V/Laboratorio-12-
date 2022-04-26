import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'listaEstudiantes.dart';
import 'estudiante.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Estudiante> estudiantes = [];

  List obtenerDatos = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => leerJson(context));
  }

  Future<void> leerJson(BuildContext context) async {
    final String datosLeidos = await rootBundle.loadString('db.json');
    final datosDecodificados = await json.decode(datosLeidos);
    setState(() {
      obtenerDatos = datosDecodificados["estudiantes"];
      for (var i = 0; i < obtenerDatos.length; i++) {
        estudiantes.add(Estudiante(
            matricula: obtenerDatos[i]["matricula"],
            nombre: obtenerDatos[i]["nombre"],
            carrera: obtenerDatos[i]["carrera"],
            semestre: obtenerDatos[i]["semestre"],
            telefono: obtenerDatos[i]["telefono"],
            correo: obtenerDatos[i]["correo"]));
        //print(estudiantes[i].getDatosCompletos());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Ejemplo'),
        ),
        body: ListView(
          children: [
            listaEstudiantes(estudiantes),
          ],
        ),
      ),
    );
  }
}

