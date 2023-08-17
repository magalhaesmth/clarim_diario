import 'package:clarim_diario/src/core/aplication/interfaces/secundaria/i_dao_professor.dart';
import 'package:clarim_diario/src/core/domain/entity/professor.dart';

class ProfessorUseCase {
  salvarProfessor(Professor professor, IDaoProfessor iDaoProfessor) {
    iDaoProfessor.salvarProfessor(professor);
  }

  consultarProfessor(int id, IDaoProfessor iDaoProfessor) {
    iDaoProfessor.consultarProfessor((id));
  }

  listarProfessor(IDaoProfessor iDaoProfessor) {
    return iDaoProfessor.listarProfessores();
  }

  excluirProfessor(int id, IDaoProfessor iDaoProfessor) {
    iDaoProfessor.excluirProfessor(id);
  }
}
