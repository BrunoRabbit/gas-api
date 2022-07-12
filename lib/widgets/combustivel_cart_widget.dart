import 'dart:math';

import 'package:flutter/material.dart';

import 'package:gas_api/controllers/global_controller.dart';
import 'package:gas_api/models/combustivel_model.dart';

class CombustivelCartWidget extends StatelessWidget {
  final CombustivelModel newList;
  final List<String> splitedCreated;
  final int index;
  final GlobalController globalController;

  const CombustivelCartWidget(
    this.newList,
    this.splitedCreated,
    this.index,
    this.globalController, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Dismissible(
          key: ValueKey(Random().nextDouble()),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            globalController.deleteItem(index);
          },
          background: Container(
            color: Colors.red,
            child: const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green[400],
              radius: 10,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                        newList.bicoId,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  newList.bicoFigura,
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('R\$ ${newList.valor.toStringAsFixed(2)}'),
                    Row(
                      children: [
                        const Icon(
                          Icons.local_gas_station_rounded,
                          size: 20,
                          color: Colors.black,
                        ),
                        Text(' ${newList.volume} L'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  splitedCreated[0],
                  style: const TextStyle(
                    color: Colors.black87,
                  ),
                ),
                Text(
                  splitedCreated[1],
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
