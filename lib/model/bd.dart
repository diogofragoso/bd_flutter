import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


class Bd {
  static Database? _database;

  // Singleton para garantir que uma única instância do banco seja usada
  static final Bd instance = Bd._privateConstructor();

  Bd._privateConstructor();

  // Método para obter a instância do banco de dados
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _inicializaBd();
    return _database!;
  }

  Future<Database> _inicializaBd() async {
    final databasePath = await getApplicationSupportDirectory(); // Usando o diretório de suporte
    final path = join(databasePath.path, 'gerdau.db');

    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE pedido(id INTEGER PRIMARY KEY, prato TEXT, data DATE)',
        );
      },
      version: 1,
    );
  }

  // Inserir Dados
  Future<void> fazerPedido(String prato, String data) async {
    final db = await database; // Obtém a instância do banco
    await db.insert(
      'pedido',
      {'prato': prato, 'data': data},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Consultar Dados
  Future<List<Map<String, dynamic>>> getPedidos() async {
    final db = await database; // Obtém a instância do banco
    return await db.query('pedido');
  }

  // Atualizar Dados
  Future<void> updatePedido(int id, String prato, String data) async {
    final db = await database; // Obtém a instância do banco
    await db.update(
      'pedido',
      {'prato': prato, 'data': data},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Deletar Dados
  Future<void> deletePedido(int id) async {
    final db = await database; // Obtém a instância do banco
    await db.delete(
      'pedido',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
