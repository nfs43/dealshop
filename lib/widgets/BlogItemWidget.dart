import 'package:dealshop/providers/BottomBarProvider.dart';
import 'package:dealshop/routes/Routes.dart';
import 'package:dealshop/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlogItem extends StatelessWidget {
  final String imageUrl;
  final String personName;
    final String imageorvideo;


  const BlogItem({required this.imageUrl,required this.imageorvideo, required this.personName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<BottomBarProvider>(context, listen: false)
            .hideBottomBar(true);
        Navigator.pushNamed(context, RoutesName.Blogdetail).then((value) {
          Provider.of<BottomBarProvider>(context, listen: false)
              .hideBottomBar(false);
        });
      },
      child: Card(
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(30.0), // Set the border radius here
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
              if(imageorvideo=="video")
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.play_circle_filled,
                    size: 50, // Adjust the size of the icon as needed
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Text(
                            personName,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Blog',
                              style: TextStyle(color: black, fontSize: 10)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            minimumSize: Size.zero, // Set this
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8), //
                          ),
                        ),
                      ),
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
