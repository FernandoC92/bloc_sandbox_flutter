import 'package:bloc_sandbox/models/address_ex1.model.dart';
import 'package:dio/dio.dart';

class Ex1Repository {
  Future searchCep(String cep) async {
    String url = 'https://viacep.com.br/ws/$cep/json';
    try {
      Response response = await Dio().get(url);
      return AddressEx1.fromJson(response.data);
    } catch (e) {
      print('#### $e ####');
    }
  }
}
