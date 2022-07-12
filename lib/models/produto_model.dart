class ProdutoModel {
  int produtoId;
  String nome;
  String descricao;
  double valor;
  bool status;
  String figura;

  ProdutoModel({
    required this.produtoId,
    required this.nome,
    required this.descricao,
    required this.valor,
    required this.status,
    required this.figura,
  });
}
