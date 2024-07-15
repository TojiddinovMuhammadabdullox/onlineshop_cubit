import 'package:bloc_store/blocs/cart_cubit.dart';
import 'package:bloc_store/blocs/order_cubit.dart';
import 'package:bloc_store/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: BlocBuilder<CartCubit, Cart>(
        builder: (context, cart) {
          return ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final cartItem = cart.items[index];
              return ListTile(
                title: Text(cartItem.product.title),
                subtitle: Text('Quantity: ${cartItem.quantity}'),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    context.read<CartCubit>().removeFromCart(cartItem.product);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final cartItems = context.read<CartCubit>().state.items;
          final products =
              cartItems.map((cartItem) => cartItem.product).toList();
          context.read<OrderCubit>().addOrder(products);
          context.read<CartCubit>().clearCart();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Order Placed'),
              content: const Text('Your order has been placed successfully!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
