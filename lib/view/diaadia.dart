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


      void exibirAlerta(String msg) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title:  Text('Atenção'),
              content: Text(msg),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }

    Future<void> _fazerPedido(String prato, String data) async {

      try {        
      await Bd.instance.fazerPedido(prato, data);
      exibirAlerta('Pedido realizado com sucesso!');
      } catch (e) {
        exibirAlerta('Erro ao realizar o pedido:  $e');
        print(e);
      }
    } 

    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue[500],
          title: const Center(child: Text('Dia a dia', style: TextStyle(color: Colors.white, fontSize: 30),)),
        ),
        body: Column(

          children: [          
              
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Image.asset(
                    'assets/img/diaadia.jpg',
                    fit: BoxFit.cover,
                    ),
                  ),              

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [              
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    
                  ),
                  onPressed: () {
                  print('Fazendo o pedido');
                  _fazerPedido('Dia a dia', '2024-10-02');              
                  
                }, child: const Text("Fazer pedido", style: TextStyle(color: Colors.white),)),
              ),
            ],),


              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [              
              ElevatedButton(onPressed: () {
              
                Navigator.pushNamed(context, '/pedidos');              
                
              }, child: const Text("Visualizar pedidos")),
            ],),
             Row(children: [
                ElevatedButton(onPressed: () {
                 Navigator.pushReplacementNamed(context, '/');

                }, child: Text('Voltar'))

            ],),
            const Row(children: [],),
            const Row(children: [],),
            const Row(children: [],),
          ],
        ),








      ),
    );
  }
  
  
}