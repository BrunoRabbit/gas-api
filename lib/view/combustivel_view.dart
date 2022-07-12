import 'package:flutter/material.dart';
import 'package:gas_api/controllers/combustivel_controller.dart';
import 'package:gas_api/controllers/global_controller.dart';
import 'package:gas_api/data/listas.dart';
import 'package:gas_api/models/combustivel_model.dart';
import 'package:gas_api/styles/colors.dart';
import 'package:provider/provider.dart';

class CombustivelView extends StatelessWidget {
  final GlobalController globalController;

  const CombustivelView({
    Key? key,
    required this.globalController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CombustivelController value = Provider.of(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: ListView.builder(
        itemCount: listCombustivel.length,
        itemBuilder: (context, index) {
          value.newAbastecimentoId = listCombustivel[index].abastecimentoId;
          value.newBicoDescricao = listCombustivel[index].bicoDescricao;
          value.newBicoFigura = listCombustivel[index].bicoFigura;
          value.newBicoId = listCombustivel[index].bicoId;
          value.newCreatedAt = listCombustivel[index].createdAt;
          value.newStatus = listCombustivel[index].status;
          value.newValor = listCombustivel[index].valor;
          value.newVolume = listCombustivel[index].volume;
          value.newIsSelected = listCombustivel[index].isSelected;

          List<String> splitedCreated = value.newCreatedAt!.split(' ');

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
                      CombustivelModel(
                        abastecimentoId: listCombustivel[index].abastecimentoId,
                        bicoDescricao: listCombustivel[index].bicoDescricao,
                        bicoFigura: listCombustivel[index].bicoFigura,
                        bicoId: listCombustivel[index].bicoId,
                        createdAt: listCombustivel[index].createdAt,
                        status: listCombustivel[index].status,
                        valor: listCombustivel[index].valor,
                        volume: listCombustivel[index].volume,
                        isSelected: listCombustivel[index].isSelected,
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              splitedCreated[0],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              splitedCreated[1],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Container(
                            height: 28,
                            width: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                value.newBicoId.toString(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            value.newBicoFigura.toString(),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'R\$ ${value.newValor!.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.local_gas_station_rounded,
                                    size: 20,
                                  ),
                                  Text(
                                    ' ${value.newVolume} L',
                                    style: const TextStyle(
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
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
