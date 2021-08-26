import 'package:bloc_sandbox/bloc/ex4/ex4.dart';
import 'package:bloc_sandbox/models/address_ex1.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ex4Screen extends StatelessWidget {
  const Ex4Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search CEP with Cubit'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextFormField(
              decoration: InputDecoration(hintText: 'Digite o CEP aqui...'),
              onChanged: (v) {},
            ),
          ),
          BlocBuilder<Ex4Cubit, AddressEx1?>(
            builder: (context, address) {
              if (address == null) {
                return Text('Nenhum CEP inserido');
              }
              return Text(
                address.logradouro!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              );
            },
          )
        ],
      ),
    );
  }
}
