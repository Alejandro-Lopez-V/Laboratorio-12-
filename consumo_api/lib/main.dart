import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'listaEstudiantes.dart';
import 'estudiante.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List estudiantesDatos = [];

  List<Estudiante> estudiantes = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => leerJson(context));
  }

  Future<void> leerJson(BuildContext context) async {
    final String datosLeidos = await rootBundle.loadString('db.json');
    final datosDecodificados = await json.decode(datosLeidos);
    setState(() {
      estudiantesDatos = datosDecodificados["estudiantes"];
      for (var i = 0; i < estudiantesDatos.length; i++) {
        estudiantes.add(Estudiante(
            matricula: estudiantesDatos[i]["matricula"],
            nombre: estudiantesDatos[i]["nombre"],
            carrera: estudiantesDatos[i]["carrera"],
            semestre: estudiantesDatos[i]["semestre"],
            telefono: estudiantesDatos[i]["telefono"],
            correo: estudiantesDatos[i]["correo"]));

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

