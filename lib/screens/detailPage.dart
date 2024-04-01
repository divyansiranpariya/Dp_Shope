import 'package:exam/utils/product_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> values =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String catName = values['category'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Detail Page",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.8,
            fontSize: 28,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey.shade100,
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...values['images'].map((e) {
                    return Container(
                      height: 430,
                      width: 430,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(e),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  blurRadius: 7,
                  color: Colors.grey,
                  spreadRadius: 3,
                ),
              ],
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 14, left: 14, top: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${values['title']}",
                            style: TextStyle(fontSize: 25),
                          ),
                          Text(
                            "\$ ${values['price']}",
                            style: TextStyle(fontSize: 33),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 14, left: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            catName,
                            style: TextStyle(fontSize: 25, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(13),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Discription",
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                              SizedBox(
                                width: 370,
                                child: Text(
                                  "${values['description']}",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            ProductData.cartProductData.add(values);
            ProductData.convertUniqueData();
          });
        },
        child: const Icon(
          Icons.add_shopping_cart,
        ),
      ),
    );
  }
}
