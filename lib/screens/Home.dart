// ignore_for_file: prefer_const_constructors

import 'package:dealshop/providers/BottomBarProvider.dart';
import 'package:dealshop/routes/Routes.dart';
import 'package:dealshop/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> dummyData = [
    {
      'imageUrl': 'https://images.pexels.com/photos/972804/pexels-photo-972804.jpeg?auto=compress&cs=tinysrgb&w=600',
      'personName': 'John Doe',
    },
    {
      'imageUrl': 'https://images.pexels.com/photos/1926769/pexels-photo-1926769.jpeg?auto=compress&cs=tinysrgb&w=600',
      'personName': 'Jane Smith',
    },
    {
      'imageUrl': 'https://images.pexels.com/photos/428340/pexels-photo-428340.jpeg?auto=compress&cs=tinysrgb&w=600',
      'personName': 'John Doe',
    },
    {
      'imageUrl': 'https://images.pexels.com/photos/1536619/pexels-photo-1536619.jpeg?auto=compress&cs=tinysrgb&w=600',
      'personName': 'Jane Smith',
    },
    {
      'imageUrl': 'https://images.pexels.com/photos/157675/fashion-men-s-individuality-black-and-white-157675.jpeg?auto=compress&cs=tinysrgb&w=600',
      'personName': 'John Doe',
    },
    {
      'imageUrl': 'https://images.pexels.com/photos/1021693/pexels-photo-1021693.jpeg?auto=compress&cs=tinysrgb&w=600',
      'personName': 'Jane Smith',
    },
    {
      'imageUrl': 'https://images.pexels.com/photos/833052/pexels-photo-833052.jpeg?auto=compress&cs=tinysrgb&w=600',
      'personName': 'John Doe',
    },
    {
      'imageUrl': 'https://images.pexels.com/photos/428340/pexels-photo-428340.jpeg?auto=compress&cs=tinysrgb&w=600',
      'personName': 'Jane Smith',
    },
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              print('object');
            },
            child: AbsorbPointer(
              absorbing: true,
              child: SearchBar(
                  hintText: 'search...',
                  padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0)),
                  onTap: () {
                    //controller.openView();
                  },
                  onChanged: (_) {
                    //controller.openView();
                  },
                  leading: const Icon(Icons.search),
                  trailing: <Widget>[
                    Tooltip(
                      message: 'apply filter',
                      child: IconButton(
                        onPressed: () {
                          
                        },
                        icon: const Icon(Icons.tune_outlined),
                      ),
                    )
                  ],
                ),
            ),
          )
        ),
        HorizontalListView(),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: dummyData.length,
            itemBuilder: (BuildContext context, int index) {
              return GridItem(
                imageUrl: dummyData[index]['imageUrl'] ?? '',
                personName: dummyData[index]['personName'] ?? '',
              );
            },
          ),
        ),
      ],
    ));
  }
}

class GridItem extends StatelessWidget {
  final String imageUrl;
  final String personName;

  const GridItem({required this.imageUrl, required this.personName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<BottomBarProvider>(context, listen: false)
            .hideBottomBar(true);
        Navigator.pushNamed(context, RoutesName.AllProducts).then((value) {
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
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          imageUrl,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Text(
                            personName,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: white),
                          ),
                        ),
                      ),
                      Container(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Follow',
                              style: TextStyle(color: white, fontSize: 10)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: black,
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

class HorizontalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0, // Set a fixed height for each item
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/1926769/pexels-photo-1926769.jpeg?auto=compress&cs=tinysrgb&w=600',
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Fashion $index',
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
