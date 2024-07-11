import 'package:bloc/bloc.dart';
import 'product_state.dart';
import '../models/product.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductState(products: []));

  void addProduct(Product product) {
    final products = List<Product>.from(state.products)..add(product);
    emit(ProductState(products: products));
  }

  void removeProduct(String id) {
    final products =
        state.products.where((product) => product.id != id).toList();
    emit(ProductState(products: products));
  }

  void updateProduct(Product updatedProduct) {
    final products = state.products.map((product) {
      return product.id == updatedProduct.id ? updatedProduct : product;
    }).toList();
    emit(ProductState(products: products));
  }

  void toggleFavourite(String id) {
    final products = state.products.map((product) {
      return product.id == id
          ? product.copyWith(isFavourite: !product.isFavourite)
          : product;
    }).toList();
    emit(ProductState(products: products));
  }
}
