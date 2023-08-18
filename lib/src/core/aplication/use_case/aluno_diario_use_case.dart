import 'package:clarim_diario/src/core/aplication/interfaces/secundaria/i_dao_aluno_diario.dart';
import 'package:clarim_diario/src/core/domain/entity/aluno_diario.dart';

class AlunoDiarioUseCase {
  salvarAluno(AlunoDiario alunoDiario, IDaoAlunoDiario iDaoAlunoDiario) {
    iDaoAlunoDiario.salvarAlunoDiario(alunoDiario);
  }

  consultarAluno(int id, IDaoAlunoDiario iDaoAlunoDiario) {
    iDaoAlunoDiario.consultarAlunoDiario(id);
  }

  listarAluno(IDaoAlunoDiario iDaoAlunoDiario) {
    return iDaoAlunoDiario.listarDiariosAula();
  }
}
