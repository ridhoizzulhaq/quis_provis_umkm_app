import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'main_screen.dart';
import 'umkm_cubit.dart';
import 'umkm_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final repository = UmkmRepository();

    return MaterialApp(
      title: 'UMKM App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => UmkmCubit(repository: repository),
        child: MainScreen(),
      ),
    );
  }
}
