import 'package:equatable/equatable.dart';
import 'package:bloc_store/models/product.dart';

class Order extends Equatable {
  final String id;
  final List<Product> products;
  final DateTime date;

  Order({
    required this.id,
    required this.products,
    required this.date,
  });

  @override
  List<Object> get props => [id, products, date];
}
