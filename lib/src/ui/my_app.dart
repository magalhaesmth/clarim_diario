import 'package:clarim_diario/src/ui/form.dart';
import 'package:clarim_diario/src/ui/home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diario de Aula',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(255, 0, 255, 0)),
        useMaterial3: true,
      ),
      home: const FormDiario(),
    );
  }
}
