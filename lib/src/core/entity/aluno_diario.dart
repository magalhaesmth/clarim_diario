import 'package:clarim_diario/src/core/entity/aluno.dart';
import 'package:clarim_diario/src/core/entity/diario_aula.dart';

class AlunoDiario {
  late dynamic id;
  late DiarioAula diarioAula;
  late Aluno aluno;
  late String conceito;
  late String frequencia;
  late String feedback;
  
  AlunoDiario({ this.id,required this.aluno, required this.conceito, required this.diarioAula, required this.feedback, required this.frequencia});
}
