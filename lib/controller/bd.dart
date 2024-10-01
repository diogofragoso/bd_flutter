import 'package:mysql_client/mysql_client.dart';

class Bd {


 // cria a conexão
 Future<MySQLConnection> createConnection() async {
    // Cria a conexão
    final conn = await MySQLConnection.createConnection(
      host: "localhost",
      port: 3306,
      userName: "root",
      password: "",
      databaseName: "gerdau", // opcional
    );

    return conn;
  }



void inserir() async {

  try {
      final conn = await createConnection();

      // Executa a query de inserção
      await conn.execute(
        "INSERT INTO menu (id_pedido, menu_fk, data_pedido) VALUES (:id_pedido, :menu_fk, :data_pedido)",
        {
          "id_pedido": null, // autoincremento automatico
          "menu_fk": 1,
          "data_pedido": "2022-02-01", // formato: AAAA-MM-DD
        },
      );        

      await conn.close();
    } catch (e) {
      print("Erro ao inserir dados: $e");
    }



    

        
 
} // Fim de inserir 





} // Fim da classe