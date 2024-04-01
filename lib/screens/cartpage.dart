import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import '../utils/product_data.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Cart Page",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.only(right: 18, top: 18, left: 18),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProductData.cartProductData.isEmpty
                        ? Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 320),
                              child: Text(
                                "No any products ",
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          )
                        : Column(
                            children: [
                              ...ProductData.cartProductData.map(
                                (e) => Container(
                                  margin: EdgeInsets.only(bottom: 13),
                                  height: 150,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.grey.shade300,
                                        blurRadius: 5,
                                        spreadRadius: 2,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 150,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                "${e['thumbnail']}"),
                                            fit: BoxFit.cover,
                                          ),
                                          // color: Colors.amber,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 15,
                                          left: 10,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                bottom: 7,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${e['title']}",
                                                    style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8),
                                                    child: Text(
                                                      "\$${e['price']}",
                                                      style: TextStyle(
                                                        fontSize: 20.5,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  ProductData.cartProductData
                                                      .remove(e);
                                                });
                                              },
                                              child: Text(
                                                " DELETE",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationColor: Colors.red,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$ ${ProductData.totalPrice()}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
