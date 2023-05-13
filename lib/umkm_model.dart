import 'package:equatable/equatable.dart';

class Umkm extends Equatable {
  final String name;
  final String description;

  Umkm({
    required this.name,
    required this.description,
  });

  @override
  List<Object?> get props => [name, description];

  factory Umkm.fromJson(Map<String, dynamic> json) {
    return Umkm(
      name: json['nama'] as String? ?? '',
      description: json['jenis'] as String? ?? '',
    );
  }
}
