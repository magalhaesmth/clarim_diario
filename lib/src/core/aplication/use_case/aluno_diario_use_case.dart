import 'package:clarim_diario/src/core/aplication/interfaces/secundaria/i_dao_aluno_diario.dart';
import 'package:clarim_diario/src/core/domain/entity/aluno_diario.dart';

class AlunoDiarioUseCase {
  salvarAlunoDiario(AlunoDiario alunoDiario, IDaoAlunoDiario iDaoAlunoDiario) {
    iDaoAlunoDiario.salvarAlunoDiario(alunoDiario);
  }

  consultarAlunoDiario(int id, IDaoAlunoDiario iDaoAlunoDiario) {
    iDaoAlunoDiario.consultarAlunoDiario(id);
  }

  Future<List<AlunoDiario>>listarAlunoDiario(IDaoAlunoDiario iDaoAlunoDiario) {
    return iDaoAlunoDiario.listarDiariosAula();
  }
}
