import 'package:flutter/material.dart';
import 'package:gas_api/controllers/global_controller.dart';
import 'package:gas_api/data/cart_list.dart';
import 'package:gas_api/models/combustivel_model.dart';
import 'package:gas_api/models/produto_model.dart';
import 'package:gas_api/models/servico_model.dart';
import 'package:gas_api/styles/colors.dart';
import 'package:gas_api/widgets/combustivel_cart_widget.dart';
import 'package:gas_api/widgets/servicos_cart_widget.dart';
import 'package:provider/provider.dart';
import 'package:gas_api/widgets/produto_cart_widget.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final globalController = Provider.of<GlobalController>(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: const Text('Seu carrinho'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          cartList.isNotEmpty
              ? const Padding(
                  padding: EdgeInsets.only(left: 12, top: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Deslize para deletar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              : Container(),
          cartList.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: cartList.length,
                    itemBuilder: (context, index) {
                      //
                      if (cartList[index] is CombustivelModel) {
                        CombustivelModel newList =
                            cartList[index] as CombustivelModel;
                        List<String> splitedCreated =
                            newList.createdAt.split(' ');

                        return CombustivelCartWidget(
                          newList,
                          splitedCreated,
                          index,
                          globalController,
                        );
                      }
                      if (cartList[index] is ProdutoModel) {
                        ProdutoModel newList = cartList[index] as ProdutoModel;
                        return ProdutoCartWidget(
                          newList,
                          index,
                          globalController,
                        );
                      }
                      if (cartList[index] is ServicoModel) {
                        ServicoModel newList = cartList[index] as ServicoModel;
                        return ServicosCartWidget(
                          newList,
                          index,
                          globalController,
                        );
                      }
                      return Container();
                    },
                  ),
                )
              : Center(
                  child: Column(
                    children: const [
                      Text(
                        'Nenhum item encontrado!',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.search_off,
                        color: Colors.white,
                        size: 40,
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
