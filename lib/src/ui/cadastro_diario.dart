import 'package:clarim_diario/src/core/aplication/interfaces/secundaria/i_dao_diario.dart';
import 'package:clarim_diario/src/core/aplication/use_case/diario_use_case.dart';
import 'package:clarim_diario/src/core/infra/sqflite/dao/dao_diario.dart';
import 'package:flutter/material.dart';

import '../core/domain/entity/diario_aula.dart';
import '../core/domain/entity/professor.dart';
import '../core/infra/utils.dart';
import 'cadastro_diario_aula.dart';

class CadastroDiario extends StatefulWidget {
  const CadastroDiario({super.key});

  @override
  State<CadastroDiario> createState() => _CadastroDiarioState();
}

class _CadastroDiarioState extends State<CadastroDiario> {
  final TextEditingController _conteudoController = TextEditingController();
  final TextEditingController _observacoesController = TextEditingController();
  var utils = Utils();
  IDaoDiario iDaoDiario = DaoDiario();
  late Future<List<DiarioAula>> futureDiarios;

  @override
  void initState() {
    super.initState();
    futureDiarios = DiarioUseCase().listarDiarios(iDaoDiario);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text('Diários'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 117, 255, 104),
      ),
      body: FutureBuilder(
        future: futureDiarios,
        builder: (context, AsyncSnapshot<List<DiarioAula>> dados) {
          if (!dados.hasData) {
            return const CircularProgressIndicator();
          } else {
            List<DiarioAula> diarios = dados.data!;

            return ListView.builder(
              itemCount: diarios.length,
              itemBuilder: (context, index) {
                var diarioAtual = diarios[index];

                var diario = DiarioAula(
                  id: diarioAtual.id,
                  conteudo: diarioAtual.conteudo,
                  observacoes: diarioAtual.observacoes,
                  data: diarioAtual.data,
                  professor: Professor(
                    id: diarioAtual.professor.id,
                    nome: diarioAtual.professor.nome,
                  ),
                );

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
                      diario.conteudo,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Obs: ${diario.observacoes}\nData: ${utils.formatarDataDDMMYYYY(diario.data)}',
                    ),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () => {
                              //TODO fazer com que antes de excluir o diário, seja excluído o diário de aula
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.share,
                              color: Colors.blue,
                            ),
                            onPressed: () => {},
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CadastroDiarioAula(idDiario: diario.id),
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
                                professor: Professor(
                                  id: 1,
                                  nome: '',
                                ),
                              );

                              DiarioUseCase().salvarDiario(diario, iDaoDiario);

                              _conteudoController.clear();
                              _observacoesController.clear();
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
            ),
          );
        },
        tooltip: 'Adicionar',
        child: const Icon(Icons.add),
      ),
    );
  }
}
