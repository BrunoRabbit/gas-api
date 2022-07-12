import 'package:flutter/material.dart';
import 'package:gas_api/controllers/global_controller.dart';
import 'package:gas_api/data/cart_list.dart';
import 'package:gas_api/routes/routes.dart';
import 'package:gas_api/styles/colors.dart';
import 'package:gas_api/view/combustivel_view.dart';
import 'package:gas_api/view/produtos_view.dart';
import 'package:gas_api/view/servico_view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          backgroundColor: kSecondaryColor,
          title: const Text(
            'Aplicativo',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    RoutesPath.cartView,
                  );
                },
                child: Consumer<GlobalController>(
                  builder: (context, value, child) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        const Icon(
                          Icons.shopping_cart_rounded,
                          color: Colors.white,
                        ),
                        cartList.isEmpty
                            ? Container()
                            : Positioned(
                                top: 6,
                                left: 10,
                                height: 18,
                                width: 15,
                                child: AnimatedContainer(
                                  curve: Curves.easeIn,
                                  duration: const Duration(milliseconds: 400),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.green,
                                    child: Text(
                                      cartList.length.toString(),
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
          // bottom:
        ),
        body: Column(
          children: [
            const TabBar(
              indicatorColor: kSecondaryColor,
              labelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(icon: Text('Combustíveis')),
                Tab(icon: Text('Produtos')),
                Tab(icon: Text('Serviços')),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                // controller: _tabController,
                children: [
                  // My screens
                  Consumer<GlobalController>(
                    builder: (context, value, child) {
                      return CombustivelView(globalController: value);
                    },
                  ),
                  Consumer<GlobalController>(
                    builder: (context, value, child) {
                      return ProdutosView(globalController: value);
                    },
                  ),
                  Consumer<GlobalController>(
                    builder: (context, value, child) {
                      return ServicoView(globalController: value);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: kNavigatorColor,
          ),
          child: BottomNavigationBar(
            // fixedColor: kPrimaryColor,
            unselectedItemColor: Colors.grey,
            iconSize: 30,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: kPrimaryColor,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: kSecondaryColor,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_gas_station_rounded),
                label: 'b',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.playlist_add_outlined),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.timer_sharp),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: '',
              ),
            ],
            currentIndex: 0,
            selectedItemColor: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
