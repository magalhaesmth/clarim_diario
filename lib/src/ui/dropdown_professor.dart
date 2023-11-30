import 'package:clarim_diario/src/core/domain/entity/professor.dart';
import 'package:clarim_diario/src/core/infra/ddm/ddm_professor.dart';
import 'package:flutter/material.dart';

class DropdownProfessor extends StatefulWidget {
  var alunos = <Professor>[];
  ValueChanged<Professor> onBrandChanged;
  FormFieldValidator validator;

  DropdownProfessor({
    super.key,
    required this.onBrandChanged,
    required this.validator,
  });

  @override
  State<DropdownProfessor> createState() => _DropdownProfessorState();
}

class _DropdownProfessorState extends State<DropdownProfessor> {
  @override
  Widget build(BuildContext context) {
    Professor? professorSelecionado;

    return FutureBuilder(
      future: DDMProfessor().listarProfessores(),
      builder: (context, AsyncSnapshot<List<Professor>> dados) {
        var professores = dados.data;
        return DropdownButtonFormField<Professor>(
          decoration:
              const InputDecoration(labelText: 'Selecione um Professor'),
          validator: widget.validator,
          isExpanded: true,
          items: professores!.map((Professor professor) {
            return DropdownMenuItem<Professor>(
              value: professor,
              child: Text(professor.nome, overflow: TextOverflow.ellipsis),
            );
          }).toList(),
          onChanged: (Professor? professor) {
            setState(() {
              professorSelecionado = professor!;
            });
            widget.onBrandChanged(professor!);
          },
          value: professorSelecionado ?? professores?[0],
        );
      },
    );
  }
}
