import 'package:clarim_diario/src/core/entity/aluno.dart';

import '../sqflite/dao/dao_aluno.dart';

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
}
