import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
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

  void fetchPersonas() async {
    final response = await http
        .get(Uri.parse('https://primer-rest-api-18bb3-default-rtdb.firebaseio.com/Persona.json'));

    final Map<String, dynamic> data = json.decode(response.body);

    if (response.statusCode == 200) {
      for(var i = 1; i <= data.length; i++){
        estudiantes.add(Estudiante(
            matricula: data["00${i}Estudiante"]["matricula"],
            nombre: data["00${i}Estudiante"]["nombre"],
            carrera: data["00${i}Estudiante"]["carrera"],
            semestre: data["00${i}Estudiante"]["semestre"],
            telefono: data["00${i}Estudiante"]["telefono"],
            correo: data["00${i}Estudiante"]["correo"]));
      }

    } else {
      throw Exception('No se pudo cargar el archivo json');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPersonas();
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

