import 'package:bloc_sandbox/models/address_ex1.model.dart';
import 'package:dio/dio.dart';

class Ex4Api {
  Future<AddressEx1?> searchCep(String cep) async {
    final dio = Dio();
    String url = 'https://viacep.com.br/ws/$cep/json';
    try {
      Response response = await dio.get(url);
      return AddressEx1.fromJson(response.data);
    } catch (e) {
      print('===== $e =====');
    }
  }
}
