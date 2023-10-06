import 'package:clarim_diario/src/core/aplication/interfaces/secundaria/i_dao_aluno.dart';
import 'package:clarim_diario/src/core/domain/entity/aluno.dart';

class AlunoUseCase {
  salvarAluno(Aluno aluno, IDaoAluno iDaoAluno) {
    iDaoAluno.salvarAluno(aluno);
  }

  consultarAluno(int id, IDaoAluno iDaoAluno) {
    iDaoAluno.consultarAluno(id);
  }

  listarAluno(IDaoAluno iDaoAluno) {
    return iDaoAluno.listarAlunos();
  }

  atualizarAluno(Aluno aluno, IDaoAluno iDaoAluno) {
    return iDaoAluno.atualizarAluno(aluno);
  }

  excluirAluno(int id, IDaoAluno iDaoAluno) {
    iDaoAluno.excluirAluno(id);
  }
}
