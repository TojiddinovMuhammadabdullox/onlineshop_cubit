import 'package:bloc_store/models/cart_model.dart';
import 'package:bloc_store/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<Cart> {
  CartCubit() : super(Cart(items: []));

  void addToCart(Product product) {
    final items = List<CartItem>.from(state.items);
    final index = items.indexWhere((item) => item.product.id == product.id);

    if (index >= 0) {
      items[index] =
          CartItem(product: product, quantity: items[index].quantity + 1);
    } else {
      items.add(
        CartItem(
          product: product,
          quantity: 1,
        ),
      );
    }

    emit(Cart(items: items));
  }

  void removeFromCart(Product product) {
    final items =
        state.items.where((item) => item.product.id != product.id).toList();
    emit(Cart(items: items));
  }

  void clearCart() {
    emit(Cart(items: []));
  }
}
