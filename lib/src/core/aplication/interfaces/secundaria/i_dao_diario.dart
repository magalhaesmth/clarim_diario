import 'package:clarim_diario/src/core/domain/entity/diario_aula.dart';

abstract class IDaoDiario {
  Future<bool> salvarDiarioAula(DiarioAula diarioAula);

  Future<DiarioAula> consultarDiarioAula(int id);

  Future<List<DiarioAula>> listarDiariosAula();

  Future<bool> excluirDiario(int id);
}
