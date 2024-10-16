import 'package:cart_app_provider/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: TextStyle(fontSize: 20)),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                    onPressed: () {
                      cart.clear();
                    },
                    child: Text('ORDER NOW'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, index) => ListTile(
                title: Text(cart.items.values.toList()[index].title),
                subtitle: Text(
                  'Quantity: ${cart.items.values.toList()[index].quantity}',
                ),
                trailing: IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    cart.removeItem(cart.items.keys.toList()[index]);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
