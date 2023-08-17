import 'package:clarim_diario/src/ui/cadastro_aluno.dart';
import 'package:flutter/material.dart';

import 'cadastro_diario.dart';
import 'cadastro_professor.dart';

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
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CadastroProfessor(),
                  ),
                );
              },
              child: const Text('Professores'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CadastroAluno(),
                  ),
                );
              },
              child: const Text('Alunos'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CadastroDiario(),
                  ),
                );
              },
              child: const Text('Diário'),
            ),
          ],
        ),
      ),
    );
  }
}
