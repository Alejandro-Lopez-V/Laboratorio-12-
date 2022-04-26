import 'package:flutter/material.dart';
import 'estudiante.dart';

class DatosEstudiante extends StatelessWidget {
  Estudiante alumno;

  DatosEstudiante(this.alumno, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alumno"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
                child: Text(alumno.getMatricula(), style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),)
            ),

            Container(
              margin: EdgeInsets.all(10),
                child: Text(alumno.getNombre(), style: TextStyle(fontSize: 35),)
            ),

            Container(
              margin: EdgeInsets.fromLTRB(5, 20, 5, 20),
                child: Text(alumno.getCarrera(), style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),)
            ),

            Container(
              margin: EdgeInsets.all(5),
                child: Text("Semestre ${alumno.getSemestre()}", style: TextStyle(fontSize: 20),)
            ),

            Container(
              margin: EdgeInsets.all(25),
                child: Text(alumno.getTelefono(), style: TextStyle(fontSize: 25),)
            ),

            Container(
                margin: EdgeInsets.all(25),
                child: Text(alumno.getCorreo(), style: TextStyle(fontSize: 25),)
            ),

          ],
        ),
      ),
    );
  }
}
