import 'package:clarim_diario/src/core/infra/ddm/ddm_professor.dart';
import 'package:flutter/material.dart';

import '../core/aplication/interfaces/secundaria/i_dao_professor.dart';
import '../core/aplication/use_case/professor_use_case.dart';
import '../core/domain/entity/professor.dart';
import '../core/infra/sqflite/dao/dao_professor.dart';

class CadastroProfessor extends StatefulWidget {
  const CadastroProfessor({Key? key}) : super(key: key);

  @override
  State<CadastroProfessor> createState() => _CadastroProfessorState();
}

class _CadastroProfessorState extends State<CadastroProfessor> {
  final TextEditingController _nomeController = TextEditingController();
  IDaoProfessor daoProfessor = DaoProfessor();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text('Professores'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 117, 255, 104),
      ),
      body: FutureBuilder(
        future: ProfessorUseCase().listarProfessor(daoProfessor),
        builder: (context, AsyncSnapshot<List<Professor>> dados) {
          if (!dados.hasData) {
            return const CircularProgressIndicator();
          } else {
            List<Professor> professores = dados.data!;

            return ListView.builder(
              itemCount: professores.length,
              itemBuilder: (context, index) {
                var profAtual = professores[index];

                var prof = Professor(
                  id: profAtual.id,
                  nome: profAtual.nome,
                );

                return Card(
                  elevation: 2.0,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 6.0),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    title: Text(
                      prof.nome,
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(
                              Icons.edit,
                            ),
                            onPressed: () {
                              atualizarProfessor(prof, context, formKey);
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              DDMProfessor().excluirProfessor(prof.id);
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => Container(
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
                        TextFormField(
                          controller: _nomeController,
                          decoration: const InputDecoration(
                            labelText: 'Nome do Professor',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Informe o nome do professor';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                ProfessorUseCase().salvarProfessor(
                                  Professor(
                                    nome: _nomeController.text,
                                  ),
                                  daoProfessor,
                                );

                                _nomeController.clear();
                                Navigator.pop(context);
                              });
                            }
                          },
                          child: const Text('Cadastrar Professor'),
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

  Future<Widget?> atualizarProfessor(
    Professor professor,
    BuildContext context,
    GlobalKey<FormState> formKey,
  ) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
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
                  TextFormField(
                    initialValue: professor.nome,
                    decoration: const InputDecoration(
                      labelText: 'Nome do Professor',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe o nome do professor';
                      } else {
                        professor.nome = value;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          ProfessorUseCase().atualizarProfessor(
                            professor,
                            daoProfessor,
                          );
                          Navigator.pop(context);
                        });
                      }
                    },
                    child: const Text('Atualizar Professor'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
