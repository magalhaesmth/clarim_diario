import 'package:clarim_diario/src/core/domain/entity/aluno.dart';

abstract class IDaoAluno {
  Future<bool> salvarAluno(Aluno aluno);

  Future<Aluno> consultarAluno(int id);

  Future<List<Aluno>> listarAlunos();

  Future<bool> excluirAluno(int id);
}
