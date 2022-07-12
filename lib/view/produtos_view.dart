import 'package:flutter/material.dart';
import 'package:gas_api/controllers/global_controller.dart';

import 'package:gas_api/controllers/produtos_controller.dart';
import 'package:gas_api/data/listas.dart';
import 'package:gas_api/models/produto_model.dart';
import 'package:gas_api/styles/colors.dart';
import 'package:provider/provider.dart';

class ProdutosView extends StatelessWidget {
  final GlobalController globalController;

  const ProdutosView({
    Key? key,
    required this.globalController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ProdutosController value = Provider.of(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: ListView.builder(
        itemCount: listProdutos.length,
        itemBuilder: (context, index) {
          value.newDescricao = listProdutos[index].descricao;
          value.newFigura = listProdutos[index].figura;
          value.newNome = listProdutos[index].nome;
          value.newProdutoId = listProdutos[index].produtoId;
          value.newValor = listProdutos[index].valor;
          value.newStatus = listProdutos[index].status;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 75,
              child: Card(
                color: Colors.grey[200],
                elevation: 5,
                child: InkWell(
                  onTap: () {
                    globalController.addItem(
                      ProdutoModel(
                        produtoId: listProdutos[index].produtoId,
                        nome: listProdutos[index].nome,
                        figura: listProdutos[index].figura,
                        descricao: listProdutos[index].descricao,
                        status: listProdutos[index].status,
                        valor: listProdutos[index].valor,
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.green[400],
                          radius: 10,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          value.newFigura!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              value.newNome!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              value.newDescricao!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            'R\$ ${value.newValor!.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.grey[400]!,
                              ),
                            ),
                            child: const Icon(
                              Icons.add_circle_rounded,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
