/*import 'package:clarim_diario/src/core/entity/aluno.dart';
import 'package:clarim_diario/src/core/entity/diario_aula.dart';
import 'package:clarim_diario/src/core/entity/professor.dart';
import 'package:clarim_diario/src/core/sqflite/banco.dart';
import 'package:clarim_diario/src/core/sqflite/dao/dao_professor.dart';
import 'package:sqflite/sqflite.dart';

class DaoAluno {

  Future<bool> salvarDiarioAula(DiarioAula diarioAula) async {
    Database db = await Conexao.abrirConexao();
    const sql = 'INSERT INTO diario (conteudo,observacoes,data,professor_id) VALUES (?,?,?,?)';
    var linhasAfetadas = await db.rawInsert(sql, [diarioAula.conteudo, diarioAula.observacoes,diarioAula.data.toString(),diarioAula.professor.id]);
    return linhasAfetadas > 0;
  }


  Professor consultarProfesor(int id){
    DaoProfessor()
  }

  Future<DiarioAula> consultarDiarioAula(int id) async {
    late Database db;
    try {
      const sql = "SELECT * FROM diario WHERE id=?";
      db = await Conexao.abrirConexao();
      Map<String, Object?> resultado = (await db.rawQuery(sql, [id])).first;
      if (resultado.isEmpty) throw Exception('Sem registros com este id');
      DiarioAula diarioAula =
          DiarioAula(id: resultado['id'] as int, observacoes: resultado['observacoes'].toString(), conteudo: resultado['conteudo'].toString(), data: resultado['data'] as DateTime, professor: resultado['professor_id'] as Professor);
      return diarioAula;
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
      List<Aluno> alunos = resultados.map((resultado) {
        return Aluno(
            id: resultado['id'] as int, nome: resultado['nome'].toString());
      }).toList();

      return alunos;
    } catch (e) {
      throw Exception('classe DaoLocacao, método listar');
    } finally {}
  }
}*/

