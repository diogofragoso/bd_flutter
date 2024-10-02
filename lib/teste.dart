// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'view/menu.dart';
import 'view/diaadia.dart';



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          initialRoute: '/',
      routes: {
        '/diaadia': (context) => Diaadia(),
      
      },




      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          titleSpacing: 0,
          leading:Data(),
          backgroundColor: Colors.orange,
          title: Center(child: const Text('Escolha sua refeição '),
           
              
          ),
        ),
        body: const Center(
          child: Menu(),
        ),
      ),
    );
  }
}

