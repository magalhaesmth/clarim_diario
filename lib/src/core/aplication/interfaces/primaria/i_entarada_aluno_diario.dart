import 'package:clarim_diario/src/core/domain/entity/aluno_diario.dart';

abstract class IEntradaAlunoDiario {
  cadastrarAlunoDiario(AlunoDiario alunoDiario);

  listarAlunosDiario();

  consultarAlunoDiario(int id);
}
