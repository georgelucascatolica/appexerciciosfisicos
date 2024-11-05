import 'package:cloud_firestore/cloud_firestore.dart';
import '../modelos/exercicio.dart';

class FirebaseServico {
  final CollectionReference _colecaoExercicios =
  FirebaseFirestore.instance.collection('exercicios');

  // Adiciona um novo exercício
  Future<void> adicionarExercicio(Exercicio exercicio) async {
    await _colecaoExercicios.add(exercicio.toMap());
  }

  // Atualiza um exercício existente
  Future<void> atualizarExercicio(Exercicio exercicio) async {
    await _colecaoExercicios.doc(exercicio.id).update(exercicio.toMap());
  }

  // Exclui um exercício
  Future<void> excluirExercicio(String id) async {
    await _colecaoExercicios.doc(id).delete();
  }

  // Obtém a lista de exercícios em tempo real
  Stream<List<Exercicio>> obterExercicios() {
    return _colecaoExercicios.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Exercicio.fromFirestore(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }
}
