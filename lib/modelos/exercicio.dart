class Exercicio {
  String id;
  String nome;
  String descricao;

  Exercicio({required this.id, required this.nome, required this.descricao});

  // Cria um exercício a partir de dados do Firestore
  factory Exercicio.fromFirestore(Map<String, dynamic> dados, String id) {
    return Exercicio(
      id: id,
      nome: dados['nome'] ?? '',
      descricao: dados['descricao'] ?? '',
    );
  }

  // Converte o exercício para um mapa para salvar no Firebase
  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'descricao': descricao,
    };
  }
}
