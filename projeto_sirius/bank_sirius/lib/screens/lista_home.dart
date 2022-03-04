
import 'package:flutter/material.dart';

import 'lista_contatos.dart';

class Home extends StatefulWidget {
  Home ({Key? key}) : super(key: key);

 @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // Meu Codigo
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
            Padding (
            padding: const EdgeInsets.all(8.0),
              child: Image.asset('imagem/logo.png'),
        ),

            Padding (
             padding: const EdgeInsets.all(8.0),
              child: Material(
                color: Colors.blue,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                    .push(
                      MaterialPageRoute(
                          builder: (context) => ListaContatos(),

                    ),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget> [
                        Icon(Icons.people),
                        Text('Contatos'),
                      ],
                    ),
                  ),
                ),
              )
            )]
        )
        );
  }}