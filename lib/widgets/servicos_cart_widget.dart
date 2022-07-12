import 'dart:math';

import 'package:flutter/material.dart';

import 'package:gas_api/controllers/global_controller.dart';
import 'package:gas_api/models/servico_model.dart';

class ServicosCartWidget extends StatelessWidget {
  final ServicoModel newList;
  final int index;
  final GlobalController globalController;

  const ServicosCartWidget(
    this.newList,
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
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.green[400],
                  radius: 10,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(newList.figura),
              ],
            ),
            trailing: Text(
              'R\$ ${newList.valor.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  newList.nome,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  newList.descricao,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
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
