import 'package:flutter/material.dart';

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
      body: Column(children: <Widget>[
        Text('My Bag',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        Container(
          child: ListView.builder(
              itemCount: productData.length,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  child: Text('this is list of ${productData[index]}'),
                );
              }),
        )
      ]),
    );
  }
}
