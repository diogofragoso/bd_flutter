import 'package:bandodedados/view/pedido.dart';
import 'package:flutter/material.dart';
import 'view/menu.dart';
import 'view/diaadia.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',  // Usamos apenas initialRoute
      routes: {
        '/': (context) => Home(), // Página inicial
        '/diaadia': (context) => Diaadia(),
        '/pedidos': (context) => Pedido(),
      },
      title: 'Material App',
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        titleSpacing: 0,
        leading: Data(),
        backgroundColor: const Color.fromARGB(255, 247, 150, 4),
        title: Center(
          child: const Text('Escolha sua refeição'),
        ),
      ),
      body: const Center(
        child: Menu(),
      ),
    );
  }
}
