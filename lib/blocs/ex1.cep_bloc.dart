import 'dart:async';

import 'package:bloc_sandbox/models/address_ex1.model.dart';
import 'package:bloc_sandbox/repositories/ex1.repo.dart';

class Ex1Bloc {
  final StreamController<String> _streamController = StreamController<String>();
  final Ex1Repository repoEx1 = Ex1Repository();

  Sink<String> get input => _streamController.sink;
  Stream<AddressEx1> get output => _streamController.stream
      .where((cep) => cep.length > 7)
      .asyncMap((cep) => _getCepData(cep));

  Future<AddressEx1> _getCepData(String cep) async {
    AddressEx1 model = await repoEx1.searchCep(cep);
    return model;
  }
}
