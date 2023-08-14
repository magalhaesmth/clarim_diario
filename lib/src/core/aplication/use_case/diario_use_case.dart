import 'package:clarim_diario/src/core/aplication/interfaces/secundaria/i_dao_diario.dart';
import 'package:clarim_diario/src/core/domain/entity/diario_aula.dart';

class DiarioUseCase {
  salvarDiario(DiarioAula diarioAula, IDaoDiario iDaoDiario) {
    iDaoDiario.salvarDiarioAula(diarioAula);
  }

  consultarDiario(int id, IDaoDiario iDaoDiario) {
    iDaoDiario.consultarDiarioAula(id);
  }

  listarDiarios(IDaoDiario iDaoDiario) {
    return iDaoDiario.listarDiariosAula();
  }
}
