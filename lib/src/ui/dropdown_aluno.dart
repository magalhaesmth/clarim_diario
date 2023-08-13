import 'package:flutter/material.dart';

import '../core/domain/entity/aluno.dart';

class DropdownAluno extends StatefulWidget {
  var alunos = <Aluno>[];
  ValueChanged<Aluno> onBrandChanged;
  FormFieldValidator validator;

  DropdownAluno({
    super.key,
    required this.alunos,
    required this.onBrandChanged,
    required this.validator,
  });

  @override
  State<DropdownAluno> createState() => _DropdownAlunoState();
}

class _DropdownAlunoState extends State<DropdownAluno> {
  @override
  Widget build(BuildContext context) {
    Aluno alunoSelecionado;

    return DropdownButtonFormField<Aluno>(
      value: null,
      decoration: const InputDecoration(labelText: 'Selecione um Aluno'),
      validator: widget.validator,
      isExpanded: true,
      items: widget.alunos.map((Aluno aluno) {
        return DropdownMenuItem<Aluno>(
          value: aluno,
          child: Text(aluno.nome, overflow: TextOverflow.ellipsis),
        );
      }).toList(),
      onChanged: (Aluno? aluno) {
        setState(() {
          alunoSelecionado = aluno!;
        });
        widget.onBrandChanged(aluno!);
      },
    );
  }
}
