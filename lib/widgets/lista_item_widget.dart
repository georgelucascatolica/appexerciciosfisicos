import 'package:flutter/material.dart';
import '../modelos/exercicio.dart';

class ListaItemWidget extends StatelessWidget {
  final Exercicio exercicio;
  final VoidCallback aoExcluir;
  final Function(Exercicio) aoAtualizar;

  ListaItemWidget({
    required this.exercicio,
    required this.aoExcluir,
    required this.aoAtualizar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 1.0),
          bottom: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 1.0),
        ),
      ),
      child: ListTile(
        title: Text(exercicio.nome),
        subtitle: Text(exercicio.descricao),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: aoExcluir,
        ),
        onTap: () {
          aoAtualizar(exercicio);
        },
      ),
    );
  }
}
