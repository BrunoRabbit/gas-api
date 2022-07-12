import 'package:flutter/material.dart';
import 'package:gas_api/controllers/combustivel_controller.dart';
import 'package:gas_api/controllers/global_controller.dart';
import 'package:gas_api/controllers/produtos_controller.dart';
import 'package:gas_api/controllers/servico_controller.dart';
import 'package:gas_api/routes/routes.dart';
import 'package:gas_api/view/home_view.dart';
import 'package:provider/provider.dart';

void application() {
  runApp(
    const Application(),
  );
}

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GlobalController>(
          create: (_) => GlobalController(),
        ),
        ChangeNotifierProvider<ProdutosController>(
          create: (_) => ProdutosController(),
        ),
        ChangeNotifierProvider<CombustivelController>(
          create: (_) => CombustivelController(),
        ),
        ChangeNotifierProvider<ServicoController>(
          create: (_) => ServicoController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.path,
        title: 'Flutter Demo',
        home: const HomeView(),
      ),
    );
  }
}
