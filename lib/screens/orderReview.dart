import 'package:dealshop/theme.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderReview extends StatelessWidget {
  final double subtotal = 240.88;
  final double shipping = 20.00;
  final String transactionErrorMessage =
      "Your payment could not be completed with the payment information provided. Please make sure that your card and billing address information is correct, or try a different payment card, to complete this order. Contact us if you continue to have problems.";

  final List<Map<String, dynamic>> allItems = [
    {
      'id': '1',
      'name': 'Track Suite White',
      'size': 'M',
      'qty': '1',
      'price': 100.0,
      'image': 'https://m.media-amazon.com/images/I/61EJ-LQXOIL._AC_SY535_.jpg',
    },
    {
      'id': '2',
      'size': 'M',
      'qty': '1',
      'name': 'Track Suite White',
      'price': 150.0,
      'image': 'https://m.media-amazon.com/images/I/61EJ-LQXOIL._AC_SY535_.jpg',
    },
    {
      'id': '3',
      'name': 'Track Suite White',
      'size': 'M',
      'qty': '1',
      'price': 120.0,
      'image': 'https://m.media-amazon.com/images/I/61EJ-LQXOIL._AC_SY535_.jpg',
    },
    {
      'id': '4',
      'name': 'Track Suite White',
      'size': 'S',
      'qty': '1',
      'price': 200.0,
      'image': 'https://m.media-amazon.com/images/I/61EJ-LQXOIL._AC_SY535_.jpg',
    },
     {
      'id': '5',
      'name': 'Track Suite White',
      'size': 'S',
      'qty': '1',
      'price': 200.0,
      'image': 'https://m.media-amazon.com/images/I/61EJ-LQXOIL._AC_SY535_.jpg',
    }, {
      'id': '6',
      'name': 'Track Suite White',
      'size': 'S',
      'qty': '1',
      'price': 200.0,
      'image': 'https://m.media-amazon.com/images/I/61EJ-LQXOIL._AC_SY535_.jpg',
    }, {
      'id': '7',
      'name': 'Track Suite White',
      'size': 'S',
      'qty': '1',
      'price': 200.0,
      'image': 'https://m.media-amazon.com/images/I/61EJ-LQXOIL._AC_SY535_.jpg',
    }, {
      'id': '8',
      'name': 'Track Suite White',
      'size': 'S',
      'qty': '1',
      'price': 200.0,
      'image': 'https://m.media-amazon.com/images/I/61EJ-LQXOIL._AC_SY535_.jpg',
    },
  ];

  OrderReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double footerHeight = MediaQuery.of(context).size.height * 0.14;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle the back button press
          },
        ),
        title: Text(
          'Review',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        titleSpacing: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                color: Colors.white,
                margin: EdgeInsets.only(left: 20, right: 20,top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DottedBorder(
                      padding: EdgeInsets.zero,
                      borderPadding: EdgeInsets.zero,
                      dashPattern: const [10, 6],
                      color: grey,
                      strokeWidth: 2,
                      customPath: (size) {
                        return Path()
                          ..moveTo(0, 0)
                          ..lineTo(size.width, 0)
                          ..moveTo(0, size.height - 0)
                          ..lineTo(size.width, size.height - 0);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              'Order Summary',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          ListView.builder(
                                      shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: allItems.length,
                            itemBuilder: (context, index) {
                              final item = allItems[index];
                              return ItemWidget(itemData: item);
                            },
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        DottedBorder(
                          padding: EdgeInsets.zero,
                          borderPadding: EdgeInsets.zero,
                          dashPattern: const [10, 6],
                          color: grey,
                          strokeWidth: 2,
                          customPath: (size) {
                            return Path()
                              ..moveTo(0, 0)
                              ..lineTo(size.width, 0)
                              ..moveTo(0, size.height - 0)
                              ..lineTo(size.width, size.height - 0);
                          },
                          child: Column(
                            children: [
                              Container(
                                margin:
                                    EdgeInsets.only(left: 20, right: 20, top: 30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('SubTotal'),
                                    Text(
                                      '${NumberFormat.simpleCurrency().format(subtotal)}',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, top: 20, bottom: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Shipping'),
                                    Text(
                                      '${NumberFormat.simpleCurrency().format(shipping)}',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        DottedBorder(
                          padding: EdgeInsets.zero,
                          borderPadding: EdgeInsets.zero,
                          dashPattern: const [10, 6],
                          color: grey,
                          strokeWidth: 2,
                          customPath: (size) {
                            return Path()
                              ..moveTo(0, 0)
                              ..lineTo(size.width, 0)
                              ..moveTo(0, size.height - 0)
                              ..lineTo(size.width, size.height - 0);
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: TextStyle(
                                      color: black, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${NumberFormat.simpleCurrency().format(shipping)}',
                                  style: TextStyle(
                                      color: black, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        DottedBorder(
                          padding: EdgeInsets.zero,
                          borderPadding: EdgeInsets.zero,
                          dashPattern: const [10, 6],
                          color: grey,
                          strokeWidth: 2,
                          customPath: (size) {
                            return Path()
                              ..moveTo(0, 0)
                              ..lineTo(size.width, 0)
                              ..moveTo(0, size.height - 0)
                              ..lineTo(size.width, size.height - 0);
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Shipping address',
                                      style: TextStyle(
                                        color: black,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      '123 Main St',
                                      style: TextStyle(
                                        color: black,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      'New York, NY 10010',
                                      style: TextStyle(
                                        color: black,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            
                  Container(
                    margin: EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 20),
                    padding: EdgeInsets.all(10),
                    color: lightpeach,
                    child: Text(
                      transactionErrorMessage,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.zero,
            child: SizedBox(
              height: footerHeight,
                child:    Center(
                  child: Container(
                      width: double.infinity,
                      height: 60.0, 
                      margin: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text('Place Order'),
                        ),
                        onPressed: () {
                          //_startActivity(context, 1);
                          // Navigator.pushNamed(
                          //     context, RoutesName.invoiceReceipt,
                          //     arguments: {
                          //       "amount": 100.00,
                          //     });
                        },
                      ),
                    ),
                ),
              ),
          ),
        ],
      ),
    );    
  }
}

class ItemWidget extends StatelessWidget {
  final Map<String, dynamic> itemData;

  ItemWidget({required this.itemData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.network(
            itemData['image'],
            width: 100,
            height: 100,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${itemData['name']}'),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '${NumberFormat.simpleCurrency().format(itemData['price'])}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'Size',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      const WidgetSpan(
                        child: SizedBox(
                          width: 8,
                        ),
                      ),
                      TextSpan(
                        text: '${itemData['size']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'Quantity',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      const WidgetSpan(
                        child: SizedBox(
                          width: 8,
                        ),
                      ),
                      TextSpan(
                        text: '${itemData['qty']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18,
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
  }
}
