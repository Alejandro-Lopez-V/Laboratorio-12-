class Estudiante {
  String matricula;
  String nombre;
  String carrera;
  String semestre;
  String telefono;
  String correo;

  Estudiante(
      {required this.matricula,
        required this.nombre,
        required this.carrera,
        required this.semestre,
        required this.telefono,
        required this.correo});

  String getMatricula(){
    return matricula;
  }

  String getNombre(){
    return nombre;
  }

  String getCarrera(){
    return carrera;
  }

  String getSemestre(){
    return semestre;
  }

  String getTelefono(){
    return telefono;
  }

  String getCorreo(){
    return correo;
  }

  String getDatosCompletos(){
    return "(Matricula:$matricula) - (Nombre:$nombre) - (Carrera:$carrera) - (Semestre:$semestre) - (Telefono:$telefono) - (Correo:$correo)";
  }


}
