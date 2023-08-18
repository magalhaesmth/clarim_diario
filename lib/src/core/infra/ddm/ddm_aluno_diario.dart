import 'package:clarim_diario/src/core/aplication/interfaces/primaria/i_entrada_aluno.dart';
import 'package:clarim_diario/src/core/aplication/interfaces/secundaria/i_dao_aluno.dart';
import 'package:clarim_diario/src/core/aplication/interfaces/secundaria/i_dao_aluno_diario.dart';
import 'package:clarim_diario/src/core/aplication/use_case/aluno_use_case.dart';
import 'package:clarim_diario/src/core/domain/entity/aluno.dart';
import 'package:clarim_diario/src/core/domain/entity/aluno_diario.dart';
import 'package:clarim_diario/src/core/infra/sqflite/dao/dao_aluno.dart';
import 'package:clarim_diario/src/core/infra/sqflite/dao/dao_aluno_diario.dart';

import '../../aplication/interfaces/primaria/i_entarada_aluno_diario.dart';
import '../../aplication/use_case/aluno_diario_use_case.dart';

class DDMAlunoDiario implements IEntradaAlunoDiario {
  late AlunoDiario alunoDiario;
  IDaoAlunoDiario daoAluno = DaoAlunoDiario();
  AlunoDiarioUseCase useCase = AlunoDiarioUseCase();

  @override
  cadastrarAlunoDiario(AlunoDiario alunoDiario) {
    useCase.salvarAluno(alunoDiario, daoAluno);
  }

  @override
  listarAlunosDiario() {
    return useCase.listarAluno(daoAluno);
  }

  @override
  consultarAlunoDiario(int id) {
    useCase.consultarAluno(id, daoAluno);
  }
}
