import 'package:bank_sirius/database/app_database.dart';
import 'package:bank_sirius/models/contatos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'formulario_contatos.dart';

class ListaContatos extends StatelessWidget {
   ListaContatos({Key? key}) : super(key: key);


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos'),
      ),
      body: FutureBuilder<List<Favoritos>>(
        initialData: [],
        future: findAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Text('Carregando...')
                    ],
                  ),
                );
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                final List<Favoritos> favoritos = snapshot.data as List<
                    Favoritos>;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Favoritos favorito = favoritos[index];
                    return _itemFavorito(favorito);
                  },
                  itemCount: favoritos.length,

                );
                break;
            }
            return Text('Erro identificado');
          },
        ),

      floatingActionButton: FloatingActionButton(
          onPressed: () {
               Navigator.of(context)
         .push(
                   MaterialPageRoute(
                     builder: (context) => FormularioContatos(),
     ),

              );

               },
                   child: const Icon(
     Icons.add,
     ),

     ),
      );
          }
     }

     class _itemFavorito extends StatelessWidget{
  final Favoritos favoritos;

  _itemFavorito(this.favoritos);

  @override
  Widget build(BuildContext context) {
    return Card (
      child: ListTile(
        title: Text(
          favoritos.nome.toString(),
          style: TextStyle (
            fontSize: 24.0,
          ),
        ),
        subtitle: Text (
          favoritos.numerodaconta.toString(),
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
  
     }









