import 'package:cart_app_provider/model/cart.dart';
import 'package:cart_app_provider/screens/cart_screen.dart';
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
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(products[index]['title'] as String),
            subtitle: Text(
                '\$${(products[index]['price'] as double).toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                Provider.of<Cart>(context, listen: false).addItem(
                  products[index]['id'] as String,
                  products[index]['title'] as String,
                  products[index]['price'] as double,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
