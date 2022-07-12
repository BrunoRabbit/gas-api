class ServicoModel {
  int servicoId;
  String nome;
  String descricao;
  double valor;
  bool status;
  String figura;

  ServicoModel({
    required this.servicoId,
    required this.nome,
    required this.descricao,
    required this.valor,
    required this.status,
    required this.figura,
  });
}
