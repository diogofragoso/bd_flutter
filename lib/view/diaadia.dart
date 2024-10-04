import 'package:flutter/material.dart';
import '../model/bd.dart';

class Diaadia extends StatefulWidget {
  const Diaadia({super.key});

  @override
  State<Diaadia> createState() => _DiaadiaState();
}

class _DiaadiaState extends State<Diaadia> {
  int _currentIndex = 0; // Índice da aba atual

  // Páginas exibidas ao trocar de aba no menu inferior
  final List<Widget> _pages = [
    Center(child: Text('Página Home', style: TextStyle(fontSize: 24))),
    Center(child: Text('Página de Pesquisa', style: TextStyle(fontSize: 24))),
    Center(child: Text('Página de Perfil', style: TextStyle(fontSize: 24))),
  ];

  void exibirAlerta(String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Atenção'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[500],
        title: const Text(
          'Dia a dia',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
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
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.food_bank),
                  title: Text('Arroz Branco'),
                ),
                ListTile(
                  leading: Icon(Icons.food_bank),
                  title: Text('Feijão'),
                ),
                ListTile(
                  leading: Icon(Icons.food_bank),
                  title: Text('Frango grelhado'),
                ),
                ListTile(
                  leading: Icon(Icons.food_bank),
                  title: Text('Salada de alface e tomate'),
                ),
                ListTile(
                  leading: Icon(Icons.food_bank),
                  title: Text('Batata frita'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                    ),
                    onPressed: () {
                      _fazerPedido('Clássico', '2024-10-04');
                    },
                    child: const Text(
                      "Fazer pedido",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
         
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index; // Atualiza o índice quando o usuário toca em uma aba

            // Captura o evento de clique na aba "Home"
            if (_currentIndex == 0) {
              
              Navigator.pushNamed(context, '/');
             
            }else if (_currentIndex == 1) {
              Navigator.pushNamed(context, '/pedidos');
            } else if (_currentIndex == 2) {
              Navigator.pushNamed(context, '/diaadia');
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
