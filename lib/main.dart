import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'telas/lista_exercicios_tela.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Inclua as opções para web aqui
  );

  runApp(AppExercicios());
}

class AppExercicios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Exercícios',
      theme: ThemeData(
        colorScheme: ColorScheme(
          primary: Color(0xFFFFB800),
          secondary: Color(0xFF0094FF),
          tertiary: Color(0xFF4976A7),
          surface: Color(0xFF0B89DA),
          background: Color(0xFFFDF3D0),
          error: Colors.red,
          onPrimary: Colors.black,
          onSecondary: Color(0xFFFDF3D0),
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Color(0xFFFDF3D0),
          brightness: Brightness.light,
        ),
      ),
      home: ListaExerciciosTela(),
    );
  }
}
