import 'package:flutter/material.dart';

class CadastroDiario extends StatefulWidget {
  const CadastroDiario({super.key});

  @override
  State<CadastroDiario> createState() => _CadastroDiarioState();
}

class _CadastroDiarioState extends State<CadastroDiario> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _conceitoController = TextEditingController();
  final TextEditingController _frequenciaController = TextEditingController();
  final TextEditingController _feedbackController = TextEditingController();
  final TextEditingController _conteudoController = TextEditingController();
  final TextEditingController _observacoesController = TextEditingController();

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
                  child: TextFormField(
                    controller: _nomeController,
                    decoration: const InputDecoration(
                      labelText: 'Nome do aluno',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe o nome do aluno';
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
                  if (_formKey.currentState!.validate()) {}
                  //salvar no sqflite
                },
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
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
                        controller: _conteudoController,
                        decoration: const InputDecoration(
                          labelText: 'Conteúdo',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Informe o conteúdo do dia';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15.0),
                      TextFormField(
                        controller: _observacoesController,
                        decoration: const InputDecoration(
                          labelText: 'Observações',
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.pop(context);
                          }
                          //salvar no sqflite
                        },
                        child: const Text('Criar Diário'),
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
