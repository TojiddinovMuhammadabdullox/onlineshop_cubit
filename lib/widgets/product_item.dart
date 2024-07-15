import 'package:bloc_store/blocs/cart_cubit.dart';
import 'package:bloc_store/blocs/product_cubit.dart';
import 'package:bloc_store/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(product.imageUrl),
        title: Text(product.title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                product.isFavourite ? Icons.favorite : Icons.favorite_border,
              ),
              onPressed: () {
                context.read<ProductCubit>().toggleFavourite(product.id);
              },
            ),
            IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              onPressed: () {
                context.read<CartCubit>().addToCart(product);
              },
            ),
          ],
        ),
      ),
    );
  }
}
