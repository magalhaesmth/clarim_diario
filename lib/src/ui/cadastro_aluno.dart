import 'package:flutter/material.dart';

class Aluno {
  final String nome;

  Aluno(this.nome);
}

class CadastroAluno extends StatefulWidget {
  const CadastroAluno({Key? key}) : super(key: key);

  @override
  State<CadastroAluno> createState() => _CadastroAlunoState();
}

class _CadastroAlunoState extends State<CadastroAluno> {
  final List<Aluno> _alunos = [];

  TextEditingController _nomeController = TextEditingController();

  void _adicionarAluno() {
    setState(() {
      _alunos.add(Aluno(_nomeController.text));
      _nomeController.clear();
    });
  }

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
        title: const Text('Diário de Aula'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 117, 255, 104),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome do Aluno'),
            ),
          ),
          ElevatedButton(
            onPressed: _adicionarAluno,
            child: const Text('Adicionar Aluno'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _alunos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_alunos[index].nome),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _excluirAluno(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
