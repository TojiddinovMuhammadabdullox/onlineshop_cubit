import 'package:bloc_store/blocs/product_cubit.dart';
import 'package:bloc_store/blocs/product_state.dart';
import 'package:bloc_store/blocs/theme_cubit.dart';
import 'package:bloc_store/models/product.dart';
import 'package:bloc_store/pages/favorits_page.dart';
import 'package:bloc_store/widgets/product_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void addProduct(BuildContext context) {
    final idController = TextEditingController();
    final titleController = TextEditingController();
    final imageUrlController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Product'),
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
                final id = idController.text;
                final title = titleController.text;
                final imageUrl = imageUrlController.text;

                if (id.isNotEmpty && title.isNotEmpty && imageUrl.isNotEmpty) {
                  final newProduct = Product(
                    id: id,
                    title: title,
                    imageUrl: imageUrl,
                    isFavourite: false,
                  );
                  context.read<ProductCubit>().addProduct(newProduct);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Online Magazine"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (ctx) => const FavoritsPage(),
                ),
              );
            },
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: const Text("Settings"),
            ),
            ListTile(
              title: const Text("Dark mode"),
              trailing: BlocBuilder<ThemeCubit, bool>(
                builder: (context, isDarkMode) {
                  return Switch(
                    value: isDarkMode,
                    onChanged: (value) {
                      context.read<ThemeCubit>().toggleTheme();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final product = state.products[index];
              return ProductItem(product: product);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addProduct(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
