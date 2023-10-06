import 'package:clarim_diario/src/core/aplication/interfaces/secundaria/i_dao_aluno.dart';
import 'package:clarim_diario/src/core/domain/entity/aluno.dart';
import 'package:clarim_diario/src/core/infra/sqflite/banco.dart';
import 'package:sqflite/sqflite.dart';

class DaoAluno implements IDaoAluno {
  @override
  Future<bool> salvarAluno(Aluno aluno) async {
    Database db = await Conexao.abrirConexao();
    const sql = 'INSERT INTO aluno (nome) VALUES (?)';
    var linhasAfetadas = await db.rawInsert(sql, [aluno.nome]);
    return linhasAfetadas > 0;
  }

  @override
  Future<Aluno> consultarAluno(int id) async {
    late Database db;
    try {
      const sql = "SELECT * FROM aluno WHERE id=?";
      db = await Conexao.abrirConexao();
      Map<String, Object?> resultado = (await db.rawQuery(sql, [id])).first;
      if (resultado.isEmpty) throw Exception('Sem registros com este id');
      Aluno aluno =
          Aluno(id: resultado['id'] as int, nome: resultado['nome'].toString());
      return aluno;
    } catch (e) {
      throw Exception('classe TreinoDAO, método consultar');
    } finally {}
  }

  @override
  Future<List<Aluno>> listarAlunos() async {
    late Database db;
    try {
      const sql = 'SELECT * FROM aluno';
      db = await Conexao.abrirConexao();
      List<Map<String, Object?>> resultados = (await db.rawQuery(sql));
      List<Aluno> alunos = resultados.map((resultado) {
        return Aluno(
            id: resultado['id'] as int, nome: resultado['nome'].toString());
      }).toList();

      return alunos;
    } catch (e) {
      throw Exception('classe DaoLocacao, método listar');
    } finally {}
  }

  @override
  Future<bool> atualizarAluno(Aluno aluno) async {
    Database db = await Conexao.abrirConexao();

    var sql = 'UPDATE aluno SET nome = ? WHERE id = ?';

    var linhasAfetadas = await db.rawUpdate(sql, [
      aluno.nome.trim(),
      aluno.id,
    ]);

    return linhasAfetadas > 0;
  }

  @override
  Future<bool> excluirAluno(int id) async {
    Database db = await Conexao.abrirConexao();

    const sql = 'DELETE FROM aluno WHERE id =?';
    int resultados = await db.rawDelete(sql, [id]);
    return resultados > 0;
  }
}
