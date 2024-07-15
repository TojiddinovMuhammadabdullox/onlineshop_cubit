import 'package:bloc_store/models/product.dart';
import 'package:equatable/equatable.dart';

class ProductState extends Equatable {
  final List<Product> products;

  ProductState({required this.products});

  @override
  List<Object> get props => [products];
}
