// ignore_for_file: prefer_const_constructors

import 'package:dealshop/providers/videoplayerProvider.dart';
import 'package:dealshop/routes/Routes.dart';
import 'package:dealshop/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class AllProducts extends StatefulWidget {
  @override
  _AllProductState createState() => _AllProductState();
}

class _AllProductState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: MyAppBar(),
      body: Stack(
        children: [
          Consumer<VideoPlayerProvider>(
            builder: (context, videoProvider, _) {
              if (videoProvider.controller.value.isInitialized) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: videoProvider.controller.value.size.width,
                      height: videoProvider.controller.value.size.height,
                      child: VideoPlayer(videoProvider.controller),
                    ),
                  ),
                );
              } else if (videoProvider.controller.value.isBuffering) {
                // Optionally, show a loading indicator
                return Center(child: CircularProgressIndicator());
              } else if (videoProvider.controller.value.hasError) {
                // Optionally, display an error message or a placeholder
                return Center(child: Text('Error loading video'));
              } else {
                // Optionally, show a placeholder or handle other cases
                return Container();
              }
            },
          ),
          DraggableBottomSheet(),
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leadingWidth: 20,
      leading: IconButton(
        color: Colors.white,
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          // Handle back button press
        },
      ),
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 5),
            child: Text(
              'JuliaMcGuire',
              style: TextStyle(fontSize: 14, color: white),
            ),
          ),
          RatingBar.builder(
            initialRating: 4.5,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 15.0,
            itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              // Handle rating updates
            },
          ),
          Text(
            '4.9(3k)',
            style: TextStyle(fontSize: 14, color: white),
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(right: 5),
              child: ElevatedButton(
                onPressed: () {
                  // Handle follow button press
                },
                child: Text('Follow', style: TextStyle(color: black)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutesName.ProductDetails);
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        width: 160,
        height: 200,
        decoration: BoxDecoration(
          color: white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Picture
            Image.network(
              'https://sixfiftyclothing.com/cdn/shop/files/IMG-3586_720x.jpg?v=1696437770', // Replace with your product image asset
              height: 150,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            // Product Name
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
              child: Text(
                'Gig Blouse',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            // Product Rate
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
              child: Text(
                '\$23.49',
                style: TextStyle(fontSize: 12, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DraggableBottomSheet extends StatefulWidget {
  @override
  _DraggableBottomSheetState createState() => _DraggableBottomSheetState();
}

class _DraggableBottomSheetState extends State<DraggableBottomSheet> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        print(notification.extent.toString());
        // Check if the user is scrolling down
        if (notification.extent == 0.4 || notification.extent == 0.05) {
          print('arrowpress:');
          setState(() {
            isExpanded = !isExpanded;
          });
        }
        return true;
      },
      child: DraggableScrollableSheet(
        initialChildSize: isExpanded ? 0.4 : 0.1,
        minChildSize: 0.05,
        maxChildSize: 0.4,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: cream.withOpacity(0.8),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
              ),
            ),
            child: ScrollConfiguration(
             behavior: ScrollBehavior().copyWith(overscroll: false),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Icon(
                              isExpanded
                                  ? Icons.keyboard_double_arrow_down
                                  : Icons.keyboard_double_arrow_up,
                              size: 32,
                              color: black,
                            ),
                    ),
                    Container(
                      width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10
                        ),
                        child: Text(
                          'New Products',
                          style: TextStyle(fontSize: 16, color: black),
                        )),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 220,
                      child: ListView.builder(
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return ProductCard();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
