import 'package:exam/utils/product_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? DropDownValue;
  bool like = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.sort,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Dp Shop",
                  style: TextStyle(color: Colors.white, letterSpacing: 1),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('CartPage');
              },
              child: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(11),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Expanded(
                  flex: 2,
                  child: Container(
                    width: 340,
                    //  color: Colors.green,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "Finds your Best",
                              style: TextStyle(fontSize: 30),
                            ),
                            Text(
                              "   With ease...",
                              style: TextStyle(fontSize: 30),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    color: Colors.white,
                    child: Row(
                      children: [
                        DropdownButton(
                          hint: const Text(
                            "Select category...",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          value: DropDownValue,
                          onChanged: (val) {
                            setState(() {
                              DropDownValue = val as String;
                            });
                          },
                          items: ProductData.allProductData
                              .map((val) => DropdownMenuItem(
                                    value: val['categoryName'],
                                    child: Text(
                                      val['categoryName'],
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ))
                              .toList(),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        (DropDownValue != null)
                            ? ActionChip(
                                onPressed: () {
                                  setState(() {
                                    DropDownValue = null;
                                  });
                                },
                                avatar: Icon(Icons.close),
                                label: Text("Clear"),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ),
              (DropDownValue == null)
                  ? Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.white,
                        child: Container(
                          height: 50,
                          width: 340,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35))),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 13),
                            child: Row(
                              children: [
                                Icon(Icons.search_off),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "search here",
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
              Expanded(
                flex: 11,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...ProductData.allProductData.map(
                        (val) =>
                            (DropDownValue == val['categoryName'] ||
                                    DropDownValue == null)
                                ? Padding(
                                    padding: const EdgeInsets.only(bottom: 25),
                                    child: Container(
                                      height: 360,
                                      width: double.infinity,
                                      //   color: Colors.grey,
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                // color: Colors.pink,
                                                child: Container(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    "${val['categoryName']}",
                                                    style: TextStyle(
                                                      fontSize: 29,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 6,
                                            child: Container(
                                              // color: Colors.red,
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  children: [
                                                    ...val['categoryProducts']
                                                        .map(
                                                      (e) => Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pushNamed(
                                                                    ' DetailPage',
                                                                    arguments:
                                                                        e);
                                                          },
                                                          child: Container(
                                                            height: 390,
                                                            width: 180,
                                                            //color: Colors.grey,
                                                            child: Column(
                                                              children: [
                                                                Expanded(
                                                                  flex: 4,
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      boxShadow: <BoxShadow>[
                                                                        BoxShadow(
                                                                            offset: Offset(0,
                                                                                5),
                                                                            color:
                                                                                Colors.grey.shade400,
                                                                            blurRadius: 5,
                                                                            spreadRadius: 1.5),
                                                                      ],
                                                                      image: DecorationImage(
                                                                          image: NetworkImage(
                                                                              "${e['thumbnail']}"),
                                                                          fit: BoxFit
                                                                              .cover),
                                                                      color: Colors
                                                                          .grey
                                                                          .shade100,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        topRight:
                                                                            Radius.circular(33),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 2,
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade100,
                                                                      boxShadow: <BoxShadow>[
                                                                        BoxShadow(
                                                                            offset: Offset(0,
                                                                                5),
                                                                            color:
                                                                                Colors.grey.shade400,
                                                                            blurRadius: 5,
                                                                            spreadRadius: 1.5),
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(33),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Row(
                                                                            children: [
                                                                              Text(
                                                                                "${e['title']}",
                                                                                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(left: 10, right: 6),
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  "\$ ${e['price']}",
                                                                                  style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.w400),
                                                                                ),
                                                                                InkWell(
                                                                                    onTap: () {
                                                                                      setState(() {
                                                                                        like = !like;
                                                                                      });
                                                                                    },
                                                                                    child: (like)
                                                                                        ? Icon(
                                                                                            Icons.favorite_border_sharp,
                                                                                            color: Colors.red,
                                                                                            size: 27,
                                                                                          )
                                                                                        : Icon(
                                                                                            Icons.favorite,
                                                                                            color: Colors.red,
                                                                                            size: 27,
                                                                                          ))
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
