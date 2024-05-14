import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class MyBag extends StatefulWidget {
  const MyBag({super.key});

  @override
  State<MyBag> createState() => _MyBagState();
}

class _MyBagState extends State<MyBag> {
  List<Map<String, dynamic>> productData = [
    {
      'image': '',
      'name': "Pullover",
      'color': 'black',
      'size': 'L',
      'price': 51,
      'quantity': 1
    },
    {
      'image': '',
      'name': "T-Shirt",
      'color': 'Gray',
      'size': 'L',
      'price': 30,
      'quantity': 1
    },
    {
      'image': '',
      'name': "Sport Dress",
      'color': 'black',
      'size': 'M',
      'price': 43,
      'quantity': 1
    },
  ];

  // List<Product>

  void incrementQuantity(int index) {
    setState(() {
      productData[index]['quantity']++;
    });
  }

  void decrementQuantity(int index) {
    setState(() {
      if (productData[index]['quantity'] > 0) {
        productData[index]['quantity']--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    num totalQuantity = 0;
    for (var item in productData) {
      totalPrice += item['price'] * item['quantity'];
    }
    ;
    for (var item in productData) {
      totalQuantity += item['quantity'];
    }
    print(totalQuantity);
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.search)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('My Bag',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 1.h,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: productData.length,
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 2.w, left: 2.w),
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Text('image'),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Container(
                              width: 70.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '${productData[index]['name']}',
                                    style: TextStyle(
                                        fontSize: 4.w,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Row(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Color: ',
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                            TextSpan(
                                                text:
                                                    '${productData[index]['color']}',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Size: ',
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                            TextSpan(
                                                text:
                                                    '${productData[index]['size']}',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      IconButton(
                                        onPressed: () {
                                          incrementQuantity(index);
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          size: 3.w,
                                        ),
                                      ),
                                      Text('${productData[index]['quantity']}'),
                                      IconButton(
                                        onPressed: () {
                                          decrementQuantity(index);
                                        },
                                        icon: Icon(
                                          Icons.remove,
                                          size: 3.w,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(
                                  Icons.more_vert,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  '${productData[index]['price'] * productData[index]['quantity']}\$',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total amount',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text('${totalPrice}')
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('total product - ${totalQuantity}'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Container(
                        width: 100.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(child: Text('checkout')),
                      ),
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
