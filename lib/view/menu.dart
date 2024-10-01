// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return       
          
              ListView(              

                padding: EdgeInsets.zero,
                children:  [
                  ListTile(title: Center(child: Text("Menu"))),

                  GestureDetector(
                    onTap: () {
                    Navigator.pushNamed(context, '/diaadia');                      
                      
                      },
                    child: ListTile(
                      leading: Icon(Icons.food_bank),
                      title: Text("Dia a dia"),
                      subtitle: Text("Arroz Branco, Feijão, Macarrão, Frango"),
                      trailing: Icon(Icons.chevron_right),
                      
                      ),
                  ),
                  ListTile(
                    leading: Icon(Icons.food_bank),
                    title: Text("Speciale"),
                    subtitle: Text("Arroz Branco,Feijão, Strogonoff,Bife"),
                    trailing: Icon(Icons.chevron_right),
                    
                    ),
                  ListTile(
                    leading: Icon(Icons.food_bank),
                    title: Text("Vegano"),
                    subtitle: Text("Abacate temperado com limão, cebola roxa e coentro, servido com torradas integrais."),
                    trailing: Icon(Icons.chevron_right),
                    
                    ),
                  ListTile(
                    leading: Icon(Icons.food_bank),
                    title: Text("Lanche"),
                    subtitle: Text("Pão integral,Hamburguer, ovos,molho"),
                    trailing: Icon(Icons.chevron_right),
                    
                    ),

                  
               
                ],
              );
       
        // Aqui você pode adicionar mais Rows ou Widgets conforme necessário


  }
}


class Data extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtém a data atual
    DateTime agora = DateTime.now();
    
    // Formata a data no estilo dd/MM/yyyy
    String dataFormatada = DateFormat('dd/MM/yyyy').format(agora);

    return Center(             
        child: Text(
          '$dataFormatada',
          style: TextStyle(fontSize: 10),
        ),
      
    );
  }
}