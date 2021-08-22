import 'package:bloc_sandbox/repositories/ex2.auth_repo.dart';
import 'package:bloc_sandbox/views/pages/ex2.login_page.dart';
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
      home: RepositoryProvider(
        create: (context) => AuthRepository(),
        child: Ex2PageLogin(),
      ),
    );
  }
}
