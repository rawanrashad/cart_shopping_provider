import 'package:cart_app_provider/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

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
          Consumer<Cart>(
            builder: (_, cart, ch) => IconButton(
              icon: badges.Badge(
                badgeContent: Text(
                  cart.itemCount.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                child: Icon(Icons.shopping_cart),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: Colors.red,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/cart');
              },
            ),
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
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                Provider.of<Cart>(context, listen: false).addItem(
                  product['id'] as String,
                  product['title'] as String,
                  product['price'] as double,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
