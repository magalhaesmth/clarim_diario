import 'package:clarim_diario/src/core/entity/aluno.dart';

import '../sqflite/dao/dao_aluno.dart';

class AlunoService {

  salvarAluno(Aluno aluno){
    DaoAluno().salvarAluno(aluno);
  }

  consultarAluno(int id){
    DaoAluno().consultarAluno(id);
  }

  listarAluno(){
    return DaoAluno().listarAlunos();
  }

}