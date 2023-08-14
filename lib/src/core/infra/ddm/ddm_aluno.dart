import 'package:clarim_diario/src/core/aplication/interfaces/primaria/i_entrada_aluno.dart';
import 'package:clarim_diario/src/core/aplication/interfaces/secundaria/i_dao_aluno.dart';
import 'package:clarim_diario/src/core/aplication/use_case/aluno_use_case.dart';
import 'package:clarim_diario/src/core/domain/entity/aluno.dart';
import 'package:clarim_diario/src/core/infra/sqflite/dao/dao_aluno.dart';

class DDMAluno implements IEntradaAluno {
  late Aluno aluno;
  IDaoAluno daoAluno = DaoAluno();
  AlunoUseCase useCase = AlunoUseCase();

  @override
  cadastrarAluno() {
    useCase.salvarAluno(aluno, daoAluno);
  }

  @override
  listarAlunos() {
    return useCase.listarAluno(daoAluno);
  }

  @override
  excluirAluno(int id) {
    useCase.excluirAluno(id, daoAluno);
  }

  @override
  consultarAluno(int id) {
    return useCase.consultarAluno(id, daoAluno);
  }
}
