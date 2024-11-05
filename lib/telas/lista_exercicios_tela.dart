import 'package:flutter/material.dart';
import '../modelos/exercicio.dart';
import '../servicos/firebase_servico.dart';
import '../widgets/lista_item_widget.dart';
import 'adicionar_exercicio_tela.dart';

class ListaExerciciosTela extends StatelessWidget {
  final FirebaseServico _firebaseServico = FirebaseServico();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Exercícios')),
      body: StreamBuilder<List<Exercicio>>(
        stream: _firebaseServico.obterExercicios(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final exercicios = snapshot.data!;
          return ListView.builder(
            itemCount: exercicios.length,
            itemBuilder: (context, index) {
              return ListaItemWidget(
                exercicio: exercicios[index],
                aoExcluir: () => _firebaseServico.excluirExercicio(exercicios[index].id),
                aoAtualizar: (exercicio) => _firebaseServico.atualizarExercicio(exercicio),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AdicionarExercicioTela()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
