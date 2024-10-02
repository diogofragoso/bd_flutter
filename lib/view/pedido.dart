import 'package:flutter/material.dart';
import 'package:bandodedados/model/bd.dart'; // Importe a classe Bd

class Pedido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PedidoScreen(),
    );
  }
}

class PedidoScreen extends StatefulWidget {
  @override
  _PedidoScreenState createState() => _PedidoScreenState();
}

class _PedidoScreenState extends State<PedidoScreen> {
  List<Map<String, dynamic>> pedidos = [];

  @override
  void initState() {
    super.initState();
    _loadPedidos();
  }

  // Carregar pedidos do banco de dados
  Future<void> _loadPedidos() async {
    final pedidoList = await Bd.instance.getPedidos(); // Chama o método getPedidos
    setState(() {
      pedidos = pedidoList;
    });
  }

  // Inserir um novo pedido e atualizar a lista
  Future<void> _addPedido(String prato, String data) async {
    await Bd.instance.fazerPedido(prato, data); // Insere o pedido
    _loadPedidos(); // Atualiza a lista de pedidos
  }

  // Atualizar um pedido
  Future<void> _updatePedido(int id, String prato, String data) async {
    await Bd.instance.updatePedido(id, prato, data); // Atualiza o pedido
    _loadPedidos(); // Atualiza a lista de pedidos
  }

  // Excluir um pedido
  Future<void> _deletePedido(int id) async {
    await Bd.instance.deletePedido(id); // Exclui o pedido
    _loadPedidos(); // Atualiza a lista de pedidos
  }

  // Método para abrir o diálogo de edição
  void _showEditDialog(BuildContext context, int id, String prato, String data) {
    TextEditingController pratoController = TextEditingController(text: prato);
    TextEditingController dataController = TextEditingController(text: data);

    showDialog(
      context: context, // Passa o BuildContext corretamente
      builder: (BuildContext context) { // Use BuildContext aqui
        return AlertDialog(
          title: Text("Atualizar Pedido"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: pratoController,
                decoration: InputDecoration(labelText: 'Prato'),
              ),
              TextField(
                controller: dataController,
                decoration: InputDecoration(labelText: 'Data (YYYY-MM-DD)'),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Atualizar"),
              onPressed: () {
                _updatePedido(id, pratoController.text, dataController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedidos"),
      ),
      body: ListView.builder(
        itemCount: pedidos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pedidos[index]['prato']),
            subtitle: Text('Data: ${pedidos[index]['data']}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _showEditDialog(
                    context, // Passa o BuildContext corretamente
                    pedidos[index]['id'],
                    pedidos[index]['prato'],
                    pedidos[index]['data'],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deletePedido(pedidos[index]['id']),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Exemplo para adicionar um novo pedido
          _addPedido('Speciale', '2024-10-02'); // Adiciona um novo pedido
        },
      ),
    );
  }
}
