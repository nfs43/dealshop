// ignore_for_file: prefer_const_constructors

import 'package:dealshop/Utils/utils.dart';
import 'package:dealshop/theme.dart';
import 'package:dealshop/widgets/ButtonsWidgets/PrimaryButton.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShoppingReceipt extends StatefulWidget {
  @override
  _ShoppingReceiptState createState() => _ShoppingReceiptState();
}

class _ShoppingReceiptState extends State<ShoppingReceipt> {
  double amount = 0.0;
  final String address =
      "1170 Lily Cache Ln, Unit 214 Boolingbrook IL 60490, USA";
  final String phoneNumber = "(123) 456-789";
  final String transType = "profile_state";
  final String customerName = "John Mecellum";
  final String transDate = "Jan 12,2024";
  final String invSaleNumber = "1009";
  String cardNumber = "5454545454545454";
  final String cardType = "MC";
  final String cardHolder = "John Mecellum";

  final List<Map<String, dynamic>> items = [
    {"quantity": 2, "itemName": "Track Suit", "size": "M", "amount": 480.00},
    {"quantity": 1, "itemName": "Track Suit", "size": "XL", "amount": 82.00},
    // Add more items as needed
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      amount = (ModalRoute.of(context)!.settings.arguments!
          as Map<String, dynamic>)["amount"] as double;
      setState(() {});
    });

    cardNumber = maskCreditCardNumber(cardNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 50.0),
            child: Column(
              children: [
                Card(
                  elevation: 0,
                  margin: EdgeInsets.all(0),
                  child: DottedBorder(
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          Container(
                margin: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/logo/nyc.png',
                  width: 180.0,
                  height: 30.0,
                  fit: BoxFit.fill,
                ),
              ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 5),
                          child: Text(
                            address,
                            style: TextStyle(
                              color: textGreyDark,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 20.0, right: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "17 May 2023 1:00 PM",
                                style: TextStyle(
                                  color: textGrey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'See return policy',
                                style: TextStyle(
                                  color: textGrey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Divider(
                            color: Colors.grey.shade300,
                            height: 1,
                            thickness: 1,
                          ),
                        ),
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return buildDataRow(
                                items[index]["quantity"],
                                items[index]["itemName"],
                                items[index]["size"],
                                items[index]["amount"],
                              );
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Divider(
                            color: Colors.grey.shade300,
                            height: 1,
                            thickness: 1,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 10.0, left: 20.0, right: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Subtotal",
                                style: TextStyle(
                                  color: textGrey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '${NumberFormat.simpleCurrency().format(482.0)}',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: grey,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.end,
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 10.0, left: 20.0, right: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(
                                  color: black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '${NumberFormat.simpleCurrency().format(482.0)}',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: black,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.end,
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Divider(
                            color: Colors.grey.shade300,
                            height: 1,
                            thickness: 1,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 10.0, bottom: 20, left: 20.0, right: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Credit Card",
                                style: TextStyle(
                                  color: textGreyDark,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "Visa 2039",
                                style: TextStyle(
                                  color: textGreyDark,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '${NumberFormat.simpleCurrency().format(482.0)}',
                                style: TextStyle(
                                  color: textGreyDark,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: const Text('Ok'),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDataRow(
      int quantity, String itemName, String size, double amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Row(
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            quantity.toString(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 15,right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      'Size $size',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Text(
              '${NumberFormat.simpleCurrency().format(amount)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
