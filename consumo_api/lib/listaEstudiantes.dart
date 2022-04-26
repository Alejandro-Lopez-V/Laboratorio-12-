import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'estudiante.dart';


class listaEstudiantes extends StatelessWidget {
  List<Estudiante> estudiantes = [];

  listaEstudiantes(this.estudiantes, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: estudiantes.map((alumno){
        return InkWell(
          onTap: () {
            print("presionado");
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black87),
            ),

            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(estudiantes[estudiantes.indexOf(alumno)].getNombre()[0]),
              ),
              title: Text(estudiantes[estudiantes.indexOf(alumno)].getMatricula(), style: const TextStyle(fontSize: 20),),
              subtitle: Text(estudiantes[estudiantes.indexOf(alumno)].getNombre(), style: const TextStyle(fontSize: 18),),
            ),
          ),
        );
      }).toList(),
    );
    
  }
}
