import 'package:clarim_diario/src/core/domain/entity/professor.dart';

abstract class IDaoProfessor {
  Future<bool> salvarProfessor(Professor professor);

  Future<Professor> consultarProfessor(int id);

  Future<List<Professor>> listarProfessores();
}
