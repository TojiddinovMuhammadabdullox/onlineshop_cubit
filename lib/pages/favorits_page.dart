import 'package:bloc_store/blocs/product_cubit.dart';
import 'package:bloc_store/blocs/product_state.dart';
import 'package:bloc_store/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritsPage extends StatelessWidget {
  const FavoritsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourites"),
        centerTitle: true,
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          final favoriteProducts =
              state.products.where((product) => product.isFavourite).toList();
          return ListView.builder(
            itemCount: favoriteProducts.length,
            itemBuilder: (context, index) {
              final product = favoriteProducts[index];
              return ProductItem(product: product);
            },
          );
        },
      ),
    );
  }
}
