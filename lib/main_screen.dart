import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umkm_app/umkm_model.dart';
import 'package:umkm_app/detail_screen.dart';
import 'package:umkm_app/umkm_cubit.dart';
import 'package:logger/logger.dart';

class MainScreen extends StatelessWidget {
  final Logger logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar UMKM'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Saya Muhammad Ridho Izzulhaq berjanji tidak berbuat curang NIM : 2009543',
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () => context.read<UmkmCubit>().fetchUmkmList(),
              child: const Text('Reload Daftar UMKM'),
            ),
            BlocBuilder<UmkmCubit, UmkmState>(
              builder: (context, state) {
                if (state is UmkmLoading) {
                  return const CircularProgressIndicator();
                } else if (state is UmkmLoaded) {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: state.umkmList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.umkmList[index].name),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                umkm: state.umkmList[index],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is UmkmError) {
                  logger.e('An error occurred: ${state.errorMessage}'); // Log the error message
                  return const Text('Terjadi kesalahan');
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
