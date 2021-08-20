import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/order_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Brand Shop'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Buy'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Order Here'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}


