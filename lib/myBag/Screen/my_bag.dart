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
      'price': 51
    },
    {'image': '', 'name': "T-Shirt", 'color': 'Gray', 'size': 'L', 'price': 30},
    {
      'image': '',
      'name': "Sport Dress",
      'color': 'black',
      'size': 'M',
      'price': 43
    },
  ];
  @override
  Widget build(BuildContext context) {
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
              SizedBox(height: 1.h,),
              Expanded(
                child: ListView.builder(
                    itemCount: productData.length,
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Text('image'),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Container(
                              width: 80.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${productData[index]['name']}',
                                        style: TextStyle(
                                            fontSize: 4.w,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.more_vert,
                                        color: Colors.grey,
                                      )
                                    ],
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
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              )
            ]),
      ),
    );
  }
}
