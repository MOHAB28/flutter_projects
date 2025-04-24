import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ShoppingScreen(
        products: [
          Product(name: 'Mohab'),
          Product(name: 'Ahmed'), //
          Product(name: 'Ayman'), //
        ],
      ), //
    );
  }
}

class Product {
  final String name;
  const Product({required this.name});
}

class ShoppingScreen extends StatefulWidget {
  final List<Product> products;
  const ShoppingScreen({super.key, required this.products});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  final List<Product> _selectedProducts = [];

  void _addProducts(Product product) {
    setState(() {
      if (_selectedProducts.contains(product)) {
        _selectedProducts.remove(product);
      } else {
        _selectedProducts.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shop app')),
      body: Center(
        child: Column(
          children:
              widget.products.map((Product product) {
                return ShoppingCartItem(
                  inCart: _selectedProducts.contains(product),
                  onCartChanged: (inCart, product) {
                    _addProducts(product);
                  },
                  product: product,
                  //
                );
              }).toList(),
        ),
      ),
    );
  }
}

typedef OnCartChangedCallBack = void Function(bool inCart, Product product);

class ShoppingCartItem extends StatelessWidget {
  final Product product;
  final bool inCart;
  final OnCartChangedCallBack onCartChanged;

  ShoppingCartItem({
    required this.inCart,
    required this.onCartChanged,
    required this.product,
  }) : super(key: ObjectKey(product));

  Color _backgroundColor() {
    return inCart ? Colors.grey : Colors.red;
  }

  TextStyle? _textStyle() {
    if (!inCart) return null;

    return const TextStyle(
      color: Colors.blueGrey,
      decoration: TextDecoration.lineThrough, //
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 20,
      onTap: () {
        onCartChanged(inCart, product);
      },
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: _backgroundColor(),
        child: Text(
          product.name[0],
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ), //
      ),
      title: Text(product.name, style: _textStyle()),
    );
  }
}
