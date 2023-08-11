import 'package:clarim_diario/src/core/entity/aluno.dart';
import 'package:clarim_diario/src/core/entity/diario_aula.dart';
import 'package:clarim_diario/src/core/entity/professor.dart';
import 'package:clarim_diario/src/core/sqflite/banco.dart';
import 'package:clarim_diario/src/core/sqflite/dao/dao_professor.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';

class DaoAluno {

  List<DiarioAula> diarios = [];

  Future<bool> salvarAlunoDiario(DiarioAula diarioAula) async {
    Database db = await Conexao.abrirConexao();
    const sql = 'INSERT INTO alunoDiario (conceito,observacoes,data,professor_id) VALUES (?,?,?,?)';
    var linhasAfetadas = await db.rawInsert(sql, [diarioAula.conteudo, diarioAula.observacoes,diarioAula.data.toString(),diarioAula.professor.id]);
    return linhasAfetadas > 0;
  }

  Future<DiarioAula> consultarDiarioAula(int id) async {
    late Database db;
    try {
      const sql = "SELECT * FROM diario WHERE id=?";
      db = await Conexao.abrirConexao();
      Map<String, Object?> resultado = (await db.rawQuery(sql, [id])).first;
      if (resultado.isEmpty) throw Exception('Sem registros com este id');
      DiarioAula diarioAula =
          DiarioAula(id: resultado['id'] as int, observacoes: resultado['observacoes'].toString(), conteudo: resultado['conteudo'].toString(), data: DateFormat('yyyy-MM-dd').parse(resultado['data'].toString()) , professor: await DaoProfessor().consultarProfessor(resultado['professor_id'] as int));
      return diarioAula;
    } catch (e) {
      throw Exception('classe TreinoDAO, método consultar');
    } finally {}
  }

  Future<List<DiarioAula>> listarDiariosAula() async {
    late Database db;
    try {
      const sql = 'SELECT * FROM diario';
      db = await Conexao.abrirConexao();
      List<Map<String, Object?>> resultados = (await db.rawQuery(sql));
      for (var resultado in resultados) {
        diarios.add(
          DiarioAula(id: resultado['id'] as int, observacoes: resultado['observacoes'].toString(), conteudo: resultado['conteudo'].toString(), data: DateFormat('yyyy-MM-dd').parse(resultado['data'].toString()) , professor: await DaoProfessor().consultarProfessor(resultado['professor_id'] as int)),
        );
      }

      return diarios;
    } catch (e) {
      throw Exception('classe DaoLocacao, método listar');
    } finally {}
  }
}
