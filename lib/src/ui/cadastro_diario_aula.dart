import 'package:clarim_diario/src/core/aplication/interfaces/secundaria/i_dao_aluno_diario.dart';
import 'package:clarim_diario/src/core/aplication/use_case/aluno_diario_use_case.dart';
import 'package:clarim_diario/src/core/domain/entity/aluno.dart';
import 'package:clarim_diario/src/core/infra/ddm/ddm_aluno_diario.dart';
import 'package:clarim_diario/src/core/infra/sqflite/dao/dao_aluno.dart';
import 'package:clarim_diario/src/core/infra/sqflite/dao/dao_aluno_diario.dart';
import 'package:clarim_diario/src/ui/dropdown_aluno.dart';
import 'package:flutter/material.dart';

import '../core/domain/entity/aluno_diario.dart';
import '../core/infra/ddm/ddm_aluno.dart';

class CadastroDiarioAula extends StatefulWidget {
  dynamic idDiario;

  CadastroDiarioAula({super.key, required this.idDiario});

  @override
  State<CadastroDiarioAula> createState() => _CadastroDiarioAulaState();
}

class _CadastroDiarioAulaState extends State<CadastroDiarioAula> {
  final TextEditingController _conceitoController = TextEditingController();
  final TextEditingController _frequenciaController = TextEditingController();
  final TextEditingController _feedbackController = TextEditingController();
  final _dropdownController = TextEditingController();
  IDaoAlunoDiario daoAlunoDiario = DaoAlunoDiario();
  late Future<List<AlunoDiario>> futureDiarios;
  Aluno? alunoSelecionado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text('Diário de Aula'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 117, 255, 104),
      ),
      body: FutureBuilder(
        future: AlunoDiarioUseCase().listarAlunoDiario(daoAlunoDiario),
        builder: (context, AsyncSnapshot<List<AlunoDiario>> dados) {
          if (!dados.hasData) {
            return const CircularProgressIndicator();
          } else {
            List<AlunoDiario> diarios = dados.data!;

            return ListView.builder(
              itemCount: diarios.length,
              itemBuilder: (context, index) {
                var diarioAtual = diarios[index];
                var aluno = diarioAtual.aluno as Aluno;
                return Card(
                  elevation: 2.0,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 6.0,
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    title: Text(
                      aluno.nome,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Freq.: ${diarioAtual.frequencia}\nFeedback: ${diarioAtual.feedback}',
                    ),
                    trailing: SizedBox(
                      width: 100,
                      child: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          DaoAlunoDiario().excluirAlunoDiario(diarioAtual.id);
                          setState(() {});
                        },
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CadastroDiarioAula(idDiario: diarioAtual.id),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final GlobalKey<FormState> formKey = GlobalKey<FormState>();

          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (builder) => Container(
              padding: const EdgeInsets.only(
                top: 4.0,
                left: 30,
                right: 30,
                bottom: 30,
              ),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Align(
                            alignment: Alignment.center,
                            child: DropdownAluno(
                              validator: (value) {
                                if (value == null) {
                                  return 'Selecione uma opção!';
                                } else {
                                  _dropdownController.text =
                                      value.id.toString();
                                }
                                return null;
                              },
                              onBrandChanged: (value) {
                                _dropdownController.text = value.id.toString();
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
                        const SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              var alunoDiario = AlunoDiario(
                                aluno: _dropdownController.text,
                                conceito: _conceitoController.text,
                                diarioAula: widget.idDiario,
                                feedback: _feedbackController.text,
                                frequencia: _frequenciaController.text,
                              );

                              DDMAlunoDiario()
                                  .cadastrarAlunoDiario(alunoDiario);
                              setState(() {});

                              Navigator.pop(context);
                            }
                          },
                          child: const Text('Cadastrar Aluno'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        tooltip: 'Adicionar',
        child: const Icon(Icons.add),
      ),
    );
  }
}
