import 'package:clarim_diario/src/core/entity/diario_aula.dart';
import 'package:clarim_diario/src/core/entity/professor.dart';
import 'package:clarim_diario/src/core/utils.dart';
import 'package:flutter/material.dart';

class CadastroDiarioAula extends StatefulWidget {
  const CadastroDiarioAula({super.key});

  @override
  State<CadastroDiarioAula> createState() => _CadastroDiarioAulaState();
}

class _CadastroDiarioAulaState extends State<CadastroDiarioAula> {
  final TextEditingController _conteudoController = TextEditingController();
  final TextEditingController _observacoesController = TextEditingController();
  var utils = Utils();

  var diarioAula = <DiarioAula>[];

  void _adicionarDiario(DiarioAula diario) {
    setState(() {
      diarioAula.add(diario);
      _conteudoController.clear();
      _observacoesController.clear();
    });
  }

  void _excluirDiario(int index) {
    setState(() {
      diarioAula.removeAt(index);
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
          Expanded(
            child: ListView.builder(
              itemCount: diarioAula.length,
              itemBuilder: (context, index) {
                var diarioAtual = diarioAula[index];

                var diario = DiarioAula(
                  conteudo: diarioAtual.conteudo,
                  observacoes: diarioAtual.observacoes,
                  data: diarioAtual.data,
                  professor: Professor(nome: ''),
                );

                return ListTile(
                  title: Text(diario.conteudo),
                  subtitle: Text(
                    'Observações: ${diario.observacoes!}\nData Cadastro: ${utils.formatarDataDDMMYYYY(diario.data)}',
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _excluirDiario(index),
                  ),
                );
              },
            ),
          )
        ],
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
                            var diario = DiarioAula(
                              conteudo: _conteudoController.text,
                              observacoes: _observacoesController.text,
                              data: DateTime.now(),
                              professor: Professor(nome: ''),
                            );

                            _adicionarDiario(diario);
                            
                            //salvar diário no sqflite

                            Navigator.pop(context);
                          }
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
