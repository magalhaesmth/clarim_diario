import 'package:clarim_diario/src/ui/cadastro_aluno.dart';
import 'package:clarim_diario/src/ui/cadastro_diario.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clarim Diário'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CadastroAluno(),
                  ),
                );
              },
              child: const Text('Tela de Alunos'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CadastroDiario(),
                  ),
                );
              },
              child: const Text('Tela de Diário'),
            ),
          ],
        ),
      ),
    );
  }
}
