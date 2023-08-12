
import 'package:clarim_diario/src/core/domain/entity/aluno_diario.dart';

abstract class IDaoAlunoDiario {
  Future<bool> salvarAlunoDiario(AlunoDiario alunoDiario);

  Future<AlunoDiario> consultarAlunoDiario(int id);

  Future<List<AlunoDiario>> listarDiariosAula();
}
