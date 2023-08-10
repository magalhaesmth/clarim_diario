import 'package:clarim_diario/src/ui/tela_inicial.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diario de Aula',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 255, 0)),
        useMaterial3: true,
      ),
      home: const TelaInicial(),
    );
  }
}
