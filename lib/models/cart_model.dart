import 'package:bloc_store/models/product.dart';
import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  final Product product;
  final int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });

  @override
  List<Object> get props => [product, quantity];
}

class Cart extends Equatable {
  final List<CartItem> items;

  Cart({required this.items});

  List<Object> get props => [items];
}
