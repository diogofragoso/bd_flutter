import 'package:flutter/material.dart';
import 'package:bandodedados/controller/bd.dart';

Bd bd = Bd();


class Diaadia extends StatelessWidget {
  const Diaadia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text('Dia a dia')),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [              
              ElevatedButton(onPressed: () {
                print('Fazendo o pedido');
                bd.inserir();
              }, child: Text("Fazer pedido")),
            ],),
            Row(children: [],),
            Row(children: [],),
            Row(children: [],),
            Row(children: [],),
          ],
        ),








      ),
    );
  }
}