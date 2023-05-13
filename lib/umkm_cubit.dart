import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:umkm_app/umkm_model.dart';
import 'package:umkm_app/umkm_repository.dart';

part 'umkm_state.dart';

class UmkmCubit extends Cubit<UmkmState> {
  final UmkmRepository repository;

  UmkmCubit({required this.repository}) : super(UmkmInitial());

  Future<void> fetchUmkmList() async {
    try {
      emit(UmkmLoading());
      final umkmList = await repository.fetchUmkmList();
      emit(UmkmLoaded(umkmList));
    } catch (error) {
      emit(UmkmError(errorMessage: 'An error occurred: $error'));
    }
  }

  Future<void> fetchUmkmDetail(int id) async {
    try {
      emit(UmkmLoading());
      final umkm = await repository.fetchUmkmDetail(id);
      emit(UmkmDetailLoaded(umkm));
    } catch (error) {
      emit(UmkmError(errorMessage: 'An error occurred: $error'));
    }
  }
}

class UmkmError extends UmkmState {
  final String errorMessage;

  UmkmError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

