/*import 'package:clarim_diario/src/core/entity/aluno.dart';
import 'package:clarim_diario/src/core/sqflite/banco.dart';
import 'package:sqflite/sqflite.dart';

class DaoAluno{

    
  @override
  Future<bool> salvarAluno(Aluno aluno) async {
    Database db = await Conexao.abrirConexao();
    const sql = 'INSERT INTO aluno (nome, cnh) VALUES (?,?)';
    var linhasAfetadas =
        await db.rawInsert(sql, []);
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
      Aluno aluno = DtoAluno(
          id: resultado['id'] as int,
          nome: resultado['nome'].toString(),
          cnh: resultado['cnh'].toString());
      return Aluno;
    } catch (e) {
      throw Exception('classe TreinoDAO, método consultar');
    } finally {}
  }

  Future<List<Aluno>> listarAlunoss() async {
    late Database db;
    try {
      const sql = 'SELECT * FROM aluno';
      db = await Conexao.abrirConexao();
      List<Map<String, Object?>> resultados = (await db.rawQuery(sql));
      List<DtoAluno> Aluno = resultados.map((resultado) {
        return DtoAluno(
            id: resultado['id'] as int,
            nome: resultado['nome'].toString(),
            cnh: resultado['cnh'].toString());
      }).toList();

      return aluno;
    } catch (e) {
      throw Exception('classe DaoLocacao, método listar');
    } finally {}
  }
}*/

//Eduardo Corrigir
