import 'package:gas_api/models/combustivel_model.dart';
import 'package:gas_api/models/produto_model.dart';
import 'package:gas_api/models/servico_model.dart';

List<CombustivelModel> listCombustivel = [
  CombustivelModel(
    abastecimentoId: 0,
    createdAt: '17:06 16/05/22',
    bicoId: '1',
    volume: 12.980,
    valor: 70.00,
    bicoFigura: 'ET',
    status: false,
    bicoDescricao: 'Gas 0',
    isSelected: false,
  ),
  CombustivelModel(
    abastecimentoId: 1,
    createdAt: '13:02 07/09/21',
    bicoId: '2',
    volume: 15.280,
    valor: 75.00,
    bicoFigura: 'ET',
    status: false,
    bicoDescricao: 'Gas 0',
    isSelected: false,
  ),
];

List<ProdutoModel> listProdutos = [
  ProdutoModel(
    produtoId: 0,
    figura: 'OL',
    nome: 'Óleo',
    descricao: 'Lubrax',
    valor: 70.00,
    status: false,
  ),
  ProdutoModel(
    produtoId: 1,
    figura: 'GS',
    nome: 'Gasolina',
    descricao: 'Lubrax',
    valor: 10.00,
    status: false,
  ),
];

List<ServicoModel> listServicos = [
  ServicoModel(
    servicoId: 0,
    figura: 'CAR',
    nome: 'Ducha',
    descricao: 'Carro grande',
    valor: 70.00,
    status: false,
  ),
  ServicoModel(
    servicoId: 0,
    figura: 'VOLT',
    nome: 'Ducha 1',
    descricao: 'Carro pequeno',
    valor: 45.00,
    status: false,
  ),
];
