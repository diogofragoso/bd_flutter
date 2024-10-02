import 'package:flutter/material.dart';
import '../model/bd.dart';




class Diaadia extends StatefulWidget {
  const Diaadia({super.key});

  @override
  State<Diaadia> createState() => _DiaadiaState();
}

class _DiaadiaState extends State<Diaadia> {
  @override
  Widget build(BuildContext context) {


    Future<void> _fazerPedido(String prato, String data) async {
      await Bd.instance.fazerPedido(prato, data);
    } 

    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Dia a dia')),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [              
              ElevatedButton(onPressed: () {
                print('Fazendo o pedido');
                _fazerPedido('Dia a dia', '2024-10-02');              
                
              }, child: const Text("Fazer pedido")),
            ],),


              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [              
              ElevatedButton(onPressed: () {
              
                Navigator.pushNamed(context, '/pedidos');              
                
              }, child: const Text("Visualizar pedidos")),
            ],),
            const Row(children: [],),
            const Row(children: [],),
            const Row(children: [],),
            const Row(children: [],),
          ],
        ),








      ),
    );
  }
  
  
}