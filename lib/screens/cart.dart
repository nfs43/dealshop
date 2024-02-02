// ignore_for_file: prefer_const_constructors

import 'package:dealshop/Utils/utils.dart';
import 'package:dealshop/routes/Routes.dart';
import 'package:dealshop/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Cart extends StatelessWidget {
  MethodChannel platform = const MethodChannel('com.startActivity/testChannel');

  final List<Map<String, dynamic>> stores = [
    {
      'storeName': 'Store1',
      'items': [
        {
          'id': '1',
          'name': 'Track Suite White',
          'size': 'M',
          'price': 100.0,
          'image':
              'https://m.media-amazon.com/images/I/61EJ-LQXOIL._AC_SY535_.jpg',
        },
        {
          'id': '2',
          'size': 'M',
          'name': 'Track Suite White',
          'price': 150.0,
          'image':
              'https://m.media-amazon.com/images/I/61EJ-LQXOIL._AC_SY535_.jpg',
        },
      ],
    },
    {
      'storeName': 'Store2',
      'items': [
        {
          'id': '1',
          'name': 'Track Suite White',
          'size': 'M',
          'price': 120.0,
          'image':
              'https://m.media-amazon.com/images/I/61EJ-LQXOIL._AC_SY535_.jpg',
        },
        {
          'id': '2',
          'name': 'Track Suite White',
          'size': 'S',
          'price': 200.0,
          'image':
              'https://m.media-amazon.com/images/I/61EJ-LQXOIL._AC_SY535_.jpg',
        },
      ],
    },
  ];

  Future<void> _startActivity(context, amount) async {
    try {
      print(amount.toString());
      final String? result = await platform
          .invokeMethod('StartSecondActivity', {'amount': amount});

      //Print Result Message From Stripe
      if (result != null) {
        //showToast(result);
        showToast("Payment Successful");
        debugPrint('Result: $result ');
        //widget.items!.removeAt(index);
        // setState(() {
        //   widget.items;
        // });
        Navigator.pushReplacementNamed(context, RoutesName.invoiceReceipt, arguments: {
          "amount": amount,
        });
      }
    } on PlatformException catch (e) {
      debugPrint("Error: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle the back button press
          },
        ),
        title: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                'Your Cart',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: black),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                '4 items',
                style: TextStyle(fontSize: 16, color: grey),
              ),
            ),
          ],
        ),
        titleSpacing: 0,
      ),
      body: Container(
        color: white,
        child: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: stores.length,
              itemBuilder: (context, index) {
                return StoreWidget(storeData: stores[index]);
              },
            ),
          ),
          Container(
            height: 150,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('Total'),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          '${NumberFormat.simpleCurrency().format(481.76)}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                              context, RoutesName.ProductDetails,
                              arguments: {
                              });
                            },
                            child: Text(
                              'Add voucher code >',
                              style: TextStyle(color: grey),
                            ),
                          )),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: const Text('Checkout'),
                        ),
                        onPressed: () {
                          _startActivity(context, 1);
                          // Navigator.pushNamed(
                          //     context, RoutesName.invoiceReceipt,
                          //     arguments: {
                          //       "amount": 100.00,
                          //     });
                        },
                      ),
                    ],
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}

class StoreWidget extends StatefulWidget {
  final Map<String, dynamic> storeData;

  StoreWidget({required this.storeData});

  @override
  _StoreWidgetState createState() => _StoreWidgetState();
}

class _StoreWidgetState extends State<StoreWidget> {
  // Map to store the quantity of each item
  final Map<String, int> itemQuantities = {};

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              widget.storeData['storeName'],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.storeData['items'].length,
            itemBuilder: (context, index) {
              final item = widget.storeData['items'][index];
              var price = 0.0;
              // Get the quantity for the current item
              int quantity = itemQuantities[item['id']] ?? 1;
              price = quantity.toDouble() * item['price'];

              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.network(
                      item['image'],
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text('${item['name']}'),
                              RichText(
                                text: TextSpan(
                                  children: <InlineSpan>[
                                    TextSpan(
                                        text: 'Size',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: black,
                                            fontSize: 16)),
                                    const WidgetSpan(
                                      child: SizedBox(
                                          width:
                                              8), // Adjust the width according to your preference
                                    ),
                                    TextSpan(
                                        text: '${item['size']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: black,
                                            fontSize: 18)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  '${NumberFormat.simpleCurrency().format(price)}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        5.0), // Optional: add border radius for rounded corners
                                  ),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        padding: EdgeInsets.all(6),
                                        constraints: BoxConstraints(),
                                        icon: Icon(
                                          Icons.remove,
                                          size: 20,
                                        ),
                                        onPressed: () {
                                          // Decrease the quantity
                                          setState(() {
                                            if (quantity > 0) {
                                              quantity--;
                                              itemQuantities[item['id']] =
                                                  quantity;
                                            }
                                          });
                                        },
                                      ),
                                      Text('$quantity'),
                                      IconButton(
                                        padding: EdgeInsets.all(6),
                                        constraints: BoxConstraints(),
                                        icon: Icon(
                                          Icons.add,
                                          size: 20,
                                        ),
                                        onPressed: () {
                                          // Increase the quantity
                                          setState(() {
                                            quantity++;
                                            itemQuantities[item['id']] =
                                                quantity;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
