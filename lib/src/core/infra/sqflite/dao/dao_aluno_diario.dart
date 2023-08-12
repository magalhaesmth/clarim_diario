import 'package:clarim_diario/src/core/aplication/interfaces/secundaria/i_dao_aluno_diario.dart';
import 'package:clarim_diario/src/core/domain/entity/aluno_diario.dart';
import 'package:clarim_diario/src/core/infra/sqflite/banco.dart';
import 'package:clarim_diario/src/core/infra/sqflite/dao/dao_aluno.dart';
import 'package:clarim_diario/src/core/infra/sqflite/dao/dao_diario.dart';
import 'package:sqflite/sqflite.dart';

class DaoAlunoDiario implements IDaoAlunoDiario {
  List<AlunoDiario> diarios = [];

  @override
  Future<bool> salvarAlunoDiario(AlunoDiario alunoDiario) async {
    Database db = await Conexao.abrirConexao();
    const sql =
        'INSERT INTO alunoDiario (conceito,frequencia,feedback,aluno_id,diario_id) VALUES (?,?,?,?,?)';
    var linhasAfetadas = await db.rawInsert(sql, [
      alunoDiario.conceito,
      alunoDiario.frequencia,
      alunoDiario.feedback,
      alunoDiario.aluno.id,
      alunoDiario.diarioAula.id
    ]);
    return linhasAfetadas > 0;
  }

  @override
  Future<AlunoDiario> consultarAlunoDiario(int id) async {
    late Database db;
    try {
      const sql = "SELECT * FROM alunoDiario WHERE id=?";
      db = await Conexao.abrirConexao();
      Map<String, Object?> resultado = (await db.rawQuery(sql, [id])).first;
      if (resultado.isEmpty) throw Exception('Sem registros com este id');
      AlunoDiario alunoDiario = AlunoDiario(
          id: resultado['id'] as int,
          conceito: resultado['conceito'].toString(),
          feedback: resultado['feedback'].toString(),
          frequencia: resultado['frequencia'].toString(),
          aluno: await DaoAluno().consultarAluno(resultado['aluno_id'] as int),
          diarioAula: await DaoDiario()
              .consultarDiarioAula(resultado['diario_id'] as int));
      return alunoDiario;
    } catch (e) {
      throw Exception('classe TreinoDAO, método consultar');
    } finally {}
  }

  @override
  Future<List<AlunoDiario>> listarDiariosAula() async {
    late Database db;
    try {
      const sql = 'SELECT * FROM alunoDiario';
      db = await Conexao.abrirConexao();
      List<Map<String, Object?>> resultados = (await db.rawQuery(sql));
      for (var resultado in resultados) {
        diarios.add(AlunoDiario(
            id: resultado['id'] as int,
            conceito: resultado['conceito'].toString(),
            feedback: resultado['feedback'].toString(),
            frequencia: resultado['frequencia'].toString(),
            aluno:
                await DaoAluno().consultarAluno(resultado['aluno_id'] as int),
            diarioAula: await DaoDiario()
                .consultarDiarioAula(resultado['diario_id'] as int)));
      }
      return diarios;
    } catch (e) {
      throw Exception('classe DaoLocacao, método listar');
    } finally {}
  }
}
