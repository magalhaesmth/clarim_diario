import 'package:clarim_diario/src/core/aplication/interfaces/primaria/i_entrada_professor.dart';
import 'package:clarim_diario/src/core/aplication/interfaces/secundaria/i_dao_professor.dart';
import 'package:clarim_diario/src/core/aplication/use_case/professor_use_case.dart';
import 'package:clarim_diario/src/core/infra/sqflite/dao/dao_professor.dart';

import '../../domain/entity/professor.dart';

class DDMProfessor implements IEntradaProfessor {
  late Professor professor;
  IDaoProfessor daoAluno = DaoProfessor();
  ProfessorUseCase useCase = ProfessorUseCase();

  @override
  cadastrarProfessor() {
    useCase.salvarProfessor(professor, daoAluno);
  }

  @override
  listarProfessores() {
    return useCase.listarProfessor(daoAluno);
  }

  @override
  excluirProfessor(int id) {
    useCase.excluirProfessor(id, daoAluno);
  }

  @override
  atualizarProfessor(Professor professor) {
    return useCase.atualizarProfessor(professor, daoAluno);
  }

  @override
  consultarProfessor(int id) {
    return useCase.consultarProfessor(id, daoAluno);
  }
}
