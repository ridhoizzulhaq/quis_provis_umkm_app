import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'umkm_cubit.dart';
import 'umkm_model.dart';

class DetailScreen extends StatelessWidget {
  final Umkm umkm;

  DetailScreen({required this.umkm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(umkm.name),
      ),
      body: BlocBuilder<UmkmCubit, UmkmState>(
        builder: (context, state) {
          if (state is UmkmLoading) {
            return CircularProgressIndicator();
          } else if (state is UmkmDetailLoaded) {
            return Text(state.umkm.description);
          } else if (state is UmkmError) {
            return Text('Terjadi kesalahan');
            return Text('Terjadi kesalahan');
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
