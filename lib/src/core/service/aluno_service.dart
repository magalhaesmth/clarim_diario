import '../domain/entity/aluno.dart';
import '../infra/sqflite/dao/dao_aluno.dart';

class AlunoService {
  var dao = DaoAluno();

  salvarAluno(Aluno aluno) {
    return dao.salvarAluno(aluno);
  }

  consultarAluno(int id) {
    return dao.consultarAluno(id);
  }

  listarAluno() {
    return dao.listarAlunos();
  }

  excluirAluno(int id) {
    return dao.excluirAluno(id);
  }
}
