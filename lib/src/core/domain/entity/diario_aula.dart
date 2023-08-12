import 'package:clarim_diario/src/core/domain/entity/professor.dart';

class DiarioAula {
  late dynamic id;
  late Professor professor;
  late String conteudo;
  late String? observacoes;
  late DateTime data;

  DiarioAula({
    this.id,
    this.observacoes,
    required this.professor,
    required this.conteudo,
    required this.data,
  });
}
