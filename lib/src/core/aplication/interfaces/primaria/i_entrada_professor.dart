import 'package:clarim_diario/src/core/domain/entity/professor.dart';

abstract class IEntradaProfessor {
  cadastrarProfessor();

  listarProfessores();

  consultarProfessor(int id);

  atualizarProfessor(Professor professor);

  excluirProfessor(int id);
}
