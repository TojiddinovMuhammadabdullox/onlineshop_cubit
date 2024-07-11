import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product.dart';
import '../blocs/product_cubit.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(product.imageUrl),
      title: Text(product.title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              product.isFavourite ? Icons.favorite : Icons.favorite_border,
              color: product.isFavourite ? Colors.red : null,
            ),
            onPressed: () {
              context.read<ProductCubit>().toggleFavourite(product.id);
            },
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              editProduct(context, product);
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              context.read<ProductCubit>().removeProduct(product.id);
            },
          ),
        ],
      ),
      onLongPress: () {
        // Long press logic if needed
      },
    );
  }

  void editProduct(BuildContext context, Product product) {
    final idController = TextEditingController(text: product.id);
    final titleController = TextEditingController(text: product.title);
    final imageUrlController = TextEditingController(text: product.imageUrl);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Product'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: idController,
                decoration: const InputDecoration(labelText: 'ID'),
              ),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: imageUrlController,
                decoration: const InputDecoration(labelText: 'Image URL'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final updatedProduct = Product(
                  id: idController.text,
                  title: titleController.text,
                  imageUrl: imageUrlController.text,
                  isFavourite: product.isFavourite,
                );
                context.read<ProductCubit>().updateProduct(updatedProduct);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
