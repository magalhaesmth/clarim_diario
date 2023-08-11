import 'package:clarim_diario/src/core/entity/aluno.dart';
import 'package:flutter/material.dart';

import '../core/service/aluno_service.dart';
import '../core/sqflite/dao/dao_aluno.dart';

class CadastroAluno extends StatefulWidget {
  const CadastroAluno({Key? key}) : super(key: key);

  @override
  State<CadastroAluno> createState() => _CadastroAlunoState();
}

class _CadastroAlunoState extends State<CadastroAluno> {
  final List<Aluno> _alunos = [];
  TextEditingController _nomeController = TextEditingController();

  void _excluirAluno(int index) {
    setState(() {
      _alunos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text('Alunos'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 117, 255, 104),
      ),
      body: FutureBuilder(future: AlunoService().listarAluno(), 
      builder: (context, AsyncSnapshot<List<Aluno>> dados) {
        if(!dados.hasData) {
                    return const CircularProgressIndicator();
        } else{
          List<dynamic> _alunos = dados.data!;
            return ListView.builder(
              itemCount: _alunos.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2.0,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 6.0),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    title: Text(
                      _alunos[index].nome,
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        _excluirAluno(index);
                      },
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
                                  AlunoService().salvarAluno(
                                  Aluno(nome: _nomeController.text));
                              _alunos.add(Aluno(nome: _nomeController.text));
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
          );
        },
        tooltip: 'Adicionar',
        child: const Icon(Icons.add),
      ),
    );
  }
}
