import 'package:clarim_diario/src/core/aplication/interfaces/primaria/i_entrada_aluno.dart';
import 'package:clarim_diario/src/core/aplication/interfaces/secundaria/i_dao_diario.dart';
import 'package:clarim_diario/src/core/aplication/use_case/diario_use_case.dart';
import 'package:clarim_diario/src/core/domain/entity/diario_aula.dart';
import 'package:clarim_diario/src/core/infra/sqflite/dao/dao_diario.dart';

class DDMDiario implements IEntradaAluno {
  late DiarioAula diarioAula;
  IDaoDiario daoDiario = DaoDiario();
  DiarioUseCase useCase = DiarioUseCase();

  @override
  cadastrarAluno() {
    useCase.salvarDiario(diarioAula, daoDiario);
  }

  @override
  listarAlunos() {
    return useCase.listarDiarios(daoDiario);
  }

  @override
  excluirAluno(int id) {
    useCase.excluirDiario(id, daoDiario);
  }

  @override
  consultarAluno(int id) {
    return useCase.consultarDiario(id, daoDiario);
  }
}
