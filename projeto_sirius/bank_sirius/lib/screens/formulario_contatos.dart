
import 'package:bank_sirius/database/app_database.dart';
import 'package:bank_sirius/models/contatos.dart';
import 'package:flutter/material.dart';

import 'lista_contatos.dart';

class FormularioContatos extends StatefulWidget {
  const FormularioContatos({Key? key}) : super(key: key);

  @override
  _FormularioContatosState createState() => _FormularioContatosState();
}

class _FormularioContatosState extends State<FormularioContatos> {
  final TextEditingController _nomeController = TextEditingController();

  final TextEditingController _agenciaController = TextEditingController();

  final TextEditingController _contaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo favorito'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget> [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
                ),
              style: TextStyle(fontSize: 24.0,
              ),
            ),
            TextField(
              controller: _agenciaController,
              decoration: InputDecoration(
                labelText: 'Numero da Agencia',
              ),
              style: TextStyle(fontSize: 24.0,
              ),
            ),
            TextField(
              controller: _contaController,
              decoration: InputDecoration(
                labelText: 'Numero da Conta',
              ),
              style: TextStyle(fontSize: 24.0,
              ),
              keyboardType: TextInputType.number,
            ),

          SizedBox(
            width: 250.0,
            child: ElevatedButton(
                child: const Text('Adicionar Favorito'),
                onPressed: () {
                  final String nome = _nomeController.text;
                  final int? numerodaconta = int.tryParse(_contaController.text);
                 final Favoritos newFavoritos = Favoritos(0, nome, numerodaconta);
                 save(newFavoritos).then((id) => Navigator.pop(context));

    }
    ),
          ),

          ]
    ),
    ),
    );

  }

  }

