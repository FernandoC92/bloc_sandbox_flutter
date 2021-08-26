import 'package:bloc_sandbox/bloc/ex4/ex4.dart';
import 'package:bloc_sandbox/repositories/ex2.auth_repo.dart';
import 'package:bloc_sandbox/screens/ex4/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<Ex4Cubit>(
        create: (context) => Ex4Cubit(),
        child: Ex4Screen(),
      ),
    );
  }
}
