import 'package:bloc_sandbox/models/address_ex1.model.dart';
import 'package:bloc_sandbox/shared/api/ex4.api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ? Declare no genereics somente o tipo que será trabalhado
class Ex4Cubit extends Cubit<AddressEx1?> {
  final _dataService = Ex4Api();

  Ex4Cubit() : super(null);

  void getCepData(cep) async => emit(await _dataService.searchCep(cep));
}
