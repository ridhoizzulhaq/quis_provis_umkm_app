part of 'umkm_cubit.dart';

abstract class UmkmState extends Equatable {
  const UmkmState();

  @override
  List<Object> get props => [];
}

class UmkmInitial extends UmkmState {}

class UmkmLoading extends UmkmState {}

class UmkmLoaded extends UmkmState {
  final List<Umkm> umkmList;

  UmkmLoaded(this.umkmList);

  @override
  List<Object> get props => [umkmList];
}

class UmkmDetailLoaded extends UmkmState {
  final Umkm umkm;

  UmkmDetailLoaded(this.umkm);

  @override
  List<Object> get props => [umkm];
}

//mixin UmkmError implements UmkmState {}
