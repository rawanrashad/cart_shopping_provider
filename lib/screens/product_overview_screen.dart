import 'package:cart_app_provider/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductOverviewScreen extends StatelessWidget {
  final List<Map<String, Object>> products = [
    {'id': 'p1', 'title': 'Guider Mate Smart Stick', 'price': 299.99},
    {'id': 'p2', 'title': 'Guider Light', 'price': 149.99},
    {'id': 'p3', 'title': 'Braile Learner Kit', 'price': 39.99},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guider Mate Shop'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed('/cart');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (ctx, index) {
          final product = products[index];
          return ListTile(
            title: Text(product['title'] as String),
            subtitle:
                Text('\$${(product['price'] as double).toStringAsFixed(2)}'),
            trailing: Consumer<Cart>(
              builder: (ctx, cart, child) {
                final cartItem = cart.items[product['id']] ??
                    CartItem(
                      id: '',
                      title: product['title'] as String,
                      price: product['price'] as double,
                      quantity: 0,
                    );
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        cart.removeSingleItem(product['id'] as String);
                      },
                    ),
                    Text(cartItem.quantity.toString()),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        cart.addItem(
                          product['id'] as String,
                          product['title'] as String,
                          product['price'] as double,
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
