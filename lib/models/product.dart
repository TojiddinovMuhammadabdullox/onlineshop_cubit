import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String title;
  final String imageUrl;
  final bool isFavourite;

  Product({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.isFavourite = true,
  });

  Product copyWith({
    String? id,
    String? title,
    String? imageUrl,
    bool? isFavourite,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }

  @override
  List<Object?> get props => [id, title, imageUrl, isFavourite];
}
