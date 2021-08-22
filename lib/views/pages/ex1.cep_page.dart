import 'package:bloc_sandbox/blocs/ex1.cep_bloc.dart';
import 'package:bloc_sandbox/models/address_ex1.model.dart';
import 'package:flutter/material.dart';

class Ex1Page extends StatefulWidget {
  const Ex1Page({Key? key}) : super(key: key);

  @override
  _Ex1PageState createState() => _Ex1PageState();
}

class _Ex1PageState extends State<Ex1Page> {
  Ex1Bloc bloc = Ex1Bloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ex 1 Page!')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: textField(),
          ),
          StreamBuilder<AddressEx1>(
              stream: bloc.output,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    'Erro na pesquisa...',
                    style: TextStyle(color: Colors.red),
                  );
                }

                AddressEx1? model = snapshot.data;
                return Text('Bairro: ${model?.bairro}');
              })
        ],
      ),
    );
  }

  Widget textField() {
    return TextField(
      onChanged: (v) => bloc.input.add(v),
      decoration: InputDecoration(
          hintText: 'Digite seu CEP', border: OutlineInputBorder()),
    );
  }
}
