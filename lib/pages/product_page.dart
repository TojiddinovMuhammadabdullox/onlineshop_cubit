import 'package:bloc_store/blocs/product_cubit.dart';
import 'package:bloc_store/blocs/product_state.dart';
import 'package:bloc_store/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.products.length,
          itemBuilder: (context, index) {
            final product = state.products[index];
            return ProductItem(product: product);
          },
        );
      },
    );
  }
}
