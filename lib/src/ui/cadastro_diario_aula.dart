import 'package:clarim_diario/src/ui/dropdown_aluno.dart';
import 'package:flutter/material.dart';

import '../core/domain/entity/aluno.dart';

class CadastroDiarioAula extends StatefulWidget {
  const CadastroDiarioAula({super.key});

  @override
  State<CadastroDiarioAula> createState() => _CadastroDiarioAulaState();
}

class _CadastroDiarioAulaState extends State<CadastroDiarioAula> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _conceitoController = TextEditingController();
  final TextEditingController _frequenciaController = TextEditingController();
  final TextEditingController _feedbackController = TextEditingController();
  final _dropdownController = TextEditingController();

  //TODO fazer com que seja pego os valores do banco
  var alunos = <Aluno>[
    Aluno(id: '1', nome: 'Andrey'),
    Aluno(id: '2', nome: 'Eduardo'),
    Aluno(id: '3', nome: 'Matheus'),
    Aluno(id: '4', nome: 'Francisco'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text('Diário de Aula'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 117, 255, 104),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: DropdownAluno(
                    alunos: alunos,
                    validator: (value) {
                      if (value == null) {
                        return 'Selecione uma opção!';
                      }
                      return null;
                    },
                    onBrandChanged: (value) {
                      _dropdownController.text = value.id;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: TextFormField(
                    controller: _conceitoController,
                    decoration: const InputDecoration(
                      labelText: 'Conceito',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe o conceito';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: TextFormField(
                    controller: _frequenciaController,
                    decoration: const InputDecoration(
                      labelText: 'Frequência',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe a frequência';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: TextFormField(
                    controller: _feedbackController,
                    decoration: const InputDecoration(
                      labelText: 'Feedback',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // var diarioAula = AlunoDiario(
                    //   aluno: aluno,
                    //   conceito: _conceitoController.text,
                    //   diarioAula: diarioAula,
                    //   feedback: _feedbackController.text,
                    //   frequencia: _frequenciaController.text,
                    // );

                    //salvar no sqflite
                  }
                },
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
