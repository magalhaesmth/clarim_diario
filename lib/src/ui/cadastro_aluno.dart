import 'package:clarim_diario/src/core/aplication/interfaces/secundaria/i_dao_aluno.dart';
import 'package:clarim_diario/src/core/domain/entity/aluno.dart';
import 'package:clarim_diario/src/core/infra/ddm/ddm_aluno.dart';
import 'package:clarim_diario/src/core/infra/sqflite/dao/dao_aluno.dart';
import 'package:flutter/material.dart';

import '../core/aplication/use_case/aluno_use_case.dart';

class CadastroAluno extends StatefulWidget {
  const CadastroAluno({Key? key}) : super(key: key);

  @override
  State<CadastroAluno> createState() => _CadastroAlunoState();
}

class _CadastroAlunoState extends State<CadastroAluno> {
  final TextEditingController _nomeController = TextEditingController();
  IDaoAluno daoAluno = DaoAluno();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text('Alunos'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 117, 255, 104),
      ),
      body: FutureBuilder(
        future: AlunoUseCase().listarAluno(daoAluno),
        builder: (context, AsyncSnapshot<List<Aluno>> dados) {
          if (!dados.hasData) {
            return const CircularProgressIndicator();
          } else {
            List<Aluno> alunos = dados.data!;

            return ListView.builder(
              itemCount: alunos.length,
              itemBuilder: (context, index) {
                var alunoAtual = alunos[index];

                var aluno = Aluno(
                  id: alunoAtual.id,
                  nome: alunoAtual.nome,
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
                      aluno.nome,
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
                              atualizarAluno(aluno, context, formKey);
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              DDMAluno().excluirAluno(aluno.id);
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
                            labelText: 'Nome do Aluno',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Informe o nome do aluno';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                AlunoUseCase().salvarAluno(
                                  Aluno(
                                    nome: _nomeController.text,
                                  ),
                                  daoAluno,
                                );

                                _nomeController.clear();
                                Navigator.pop(context);
                              });
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

  Future<Widget?> atualizarAluno(
    Aluno aluno,
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
                    initialValue: aluno.nome,
                    decoration: const InputDecoration(
                      labelText: 'Nome do Aluno',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe o nome do aluno';
                      } else {
                        aluno.nome = value;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          DDMAluno().atualizarAluno(aluno);
                          Navigator.pop(context);
                        });
                      }
                    },
                    child: const Text('Atualizar Aluno'),
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
