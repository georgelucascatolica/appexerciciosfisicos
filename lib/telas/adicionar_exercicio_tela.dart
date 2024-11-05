import 'package:flutter/material.dart';
import '../modelos/exercicio.dart';
import '../servicos/firebase_servico.dart';

class AdicionarExercicioTela extends StatefulWidget {
  @override
  _AdicionarExercicioTelaState createState() => _AdicionarExercicioTelaState();
}

class _AdicionarExercicioTelaState extends State<AdicionarExercicioTela> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final FirebaseServico _firebaseServico = FirebaseServico();

  void _adicionarExercicio() async {
    if (_nomeController.text.isNotEmpty && _descricaoController.text.isNotEmpty) {
      Exercicio novoExercicio = Exercicio(
        id: '',
        nome: _nomeController.text,
        descricao: _descricaoController.text,
      );
      await _firebaseServico.adicionarExercicio(novoExercicio);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar Exercício')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome do Exercício'),
            ),
            TextField(
              controller: _descricaoController,
              decoration: InputDecoration(labelText: 'Descrição do Exercício'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _adicionarExercicio,
              child: Text('Adicionar'),
            ),
          ],
        ),
      ),
    );
  }
}
