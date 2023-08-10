import 'package:clarim_diario/src/core/entity/professor.dart';
import 'package:clarim_diario/src/core/sqflite/banco.dart';
import 'package:sqflite/sqflite.dart';

class DaoProfessor {
  Future<bool> salvarProfessor(Professor professor) async {
    Database db = await Conexao.abrirConexao();
    const sql = 'INSERT INTO professor (nome) VALUES (?)';
    var linhasAfetadas = await db.rawInsert(sql, [professor.nome]);
    return linhasAfetadas > 0;
  }

  Future<Professor> consultarProfessor(int id) async {
    late Database db;
    try {
      const sql = "SELECT * FROM professor WHERE id=?";
      db = await Conexao.abrirConexao();
      Map<String, Object?> resultado = (await db.rawQuery(sql, [id])).first;
      if (resultado.isEmpty) throw Exception('Sem registros com este id');
      Professor professor = Professor(
          id: resultado['id'] as int, nome: resultado['nome'].toString());
      return professor;
    } catch (e) {
      throw Exception('classe DaoProfessor, método consultar');
    } finally {}
  }

  Future<List<Professor>> listarProfessores() async {
    late Database db;
    try {
      const sql = 'SELECT * FROM professor';
      db = await Conexao.abrirConexao();
      List<Map<String, Object?>> resultados = (await db.rawQuery(sql));
      List<Professor> professores = resultados.map((resultado) {
        return Professor(
            id: resultado['id'] as int, nome: resultado['nome'].toString());
      }).toList();

      return professores;
    } catch (e) {
      throw Exception('classe DaoProfessor, método listar');
    } finally {}
  }
}
