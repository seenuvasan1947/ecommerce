import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:ecommerce/constants.dart';

import 'components/body.dart';

// ignore: use_key_in_widget_constructors
class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: kPrimaryColor,
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      title: const Text('Dashboard'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.notification_add),
          onPressed: () {},
        ),
        IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart_sharp))
      ],
    );
  }
}
