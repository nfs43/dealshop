// ignore_for_file: prefer_const_constructors

import 'package:dealshop/routes/Routes.dart';
import 'package:dealshop/theme.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                alignment: Alignment.topCenter,
                height: size.height - 300,
                width: size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.bottomRight,
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/BikersJacket.jpg'))),
              ),
            ),
             Positioned(
                top: 30,
                left: 20,
                child: Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11)),
                  child: Icon(Icons.arrow_back),
                )),
            Positioned(
                top: 30,
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, RoutesName.cart);
                  },
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11)),
                    child: Icon(Icons.shopping_bag_outlined),
                  ),
                )),
            Positioned(
                bottom: 0,
                child: Container(
                  height: size.height / 2.2,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(34),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:25.0,vertical: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacing(),
                        const ProductNameAndPrice(),
                        Spacing(),
                        Text(
                          'Every day, the #Saving extensions staff receives tens of thousands of savings and deals. We regularly update this page with the most recent sales, discounts,',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: textGrey),
                        ),
                        Spacing(),
                        const Spacing(),
                        Row(
                          children: [
                            Text('Size',
                                style: TextStyle(
                                  color: black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                     height: 50,
                                    width: 50,
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: lightgrey,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text('S',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                     height: 50,
                                    width: 50,
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: lightgrey,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text('M',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: lightgrey,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text('XL',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,),
                                            textAlign: TextAlign.center),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const Spacing(),
                                                const Spacing(),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    left: 25, right: 25, top: 15, bottom: 15),
                                decoration: BoxDecoration(
                                    color: lightgrey,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Icon(Icons.favorite_border),
                              ),
                              Container(
                                child: ElevatedButton.icon(
                                  icon: Icon(
                                    Icons.add,
                                    color: white,
                                    size: 25.0,
                                  ),
                                  label: Text('Add to Bag',style: TextStyle(fontWeight: FontWeight.bold),),
                                  onPressed: () {
                                    print('Button Pressed');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: black,
                                    padding: EdgeInsets.only(
                                      left: 50,
                                      right: 50,
                                      top: 20,
                                      bottom: 20,
                                    ),
                                    shape:  RoundedRectangleBorder(
                                      borderRadius:
                                           BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                              ),
                  
                            ],
                          ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class Spacing extends StatelessWidget {
  const Spacing({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 16,
    );
  }
}

class ProductNameAndPrice extends StatelessWidget {
  const ProductNameAndPrice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Track Suit White',
          style: TextStyle(
            color: black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacing(),
        Text(
          '\$15.00',
          style: TextStyle(
              color: black, fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
