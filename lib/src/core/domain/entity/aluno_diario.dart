import 'package:clarim_diario/src/core/domain/entity/aluno.dart';
import 'package:clarim_diario/src/core/domain/entity/diario_aula.dart';

class AlunoDiario {
  late dynamic id;
  late dynamic diarioAula;
  late dynamic aluno;
  late String conceito;
  late String frequencia;
  late String feedback;
  
  AlunoDiario({ this.id,required this.aluno, required this.conceito, required this.diarioAula, required this.feedback, required this.frequencia});
}
