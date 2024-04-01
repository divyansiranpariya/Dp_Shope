import 'package:exam/screens/cartpage.dart';
import 'package:exam/screens/detailPage.dart';
import 'package:exam/screens/home_page.dart';
import 'package:flutter/material.dart';

// import 'package:core_flutter/screen/cart_page.dart';
// import 'package:core_flutter/screen/product_detail_page.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'screen/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        ' DetailPage': (context) => const DetailPage(),
        'CartPage': (context) => const CartPage(),
      },
    ),
  );
}
