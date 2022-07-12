class CombustivelModel {
  int abastecimentoId;
  String createdAt;
  String bicoId;
  String bicoDescricao;
  String bicoFigura;
  double valor;
  double volume;
  bool status;
  bool isSelected;

  CombustivelModel({
    required this.abastecimentoId,
    required this.createdAt,
    required this.bicoId,
    required this.bicoDescricao,
    required this.bicoFigura,
    required this.valor,
    required this.volume,
    required this.status,
    required this.isSelected,
  });
}
