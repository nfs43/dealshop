// ignore_for_file: prefer_const_constructors

import 'package:dealshop/models/dashboardCategories.dart';
import 'package:dealshop/providers/BottomBarProvider.dart';
import 'package:dealshop/routes/Routes.dart';
import 'package:dealshop/screens/Home/widgets/fIlterSheet.dart';
import 'package:dealshop/theme.dart';
import 'package:dealshop/widgets/BlogItemWidget.dart';
import 'package:dealshop/widgets/InfluencerItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Feeds extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feeds> with SingleTickerProviderStateMixin {
  List<Map<String, String>> dummyData = [
    {
      'posttype': 'blog',
      'imageorvideo': 'video',
      'imageUrl':
          'https://images.pexels.com/photos/833052/pexels-photo-833052.jpeg?auto=compress&cs=tinysrgb&w=600',
      'personName': 'John Doe',
    },
    {
      'posttype': 'influencer',
      'imageorvideo': 'image',
      'imageUrl':
          'https://images.pexels.com/photos/1926769/pexels-photo-1926769.jpeg?auto=compress&cs=tinysrgb&w=600',
      'personName': 'Jane Smith',
    },
    {
      'posttype': 'influencer',
      'imageorvideo': 'image',
      'imageUrl':
          'https://images.pexels.com/photos/428340/pexels-photo-428340.jpeg?auto=compress&cs=tinysrgb&w=600',
      'personName': 'John Doe',
    },
    {
      'posttype': 'influencer',
      'imageorvideo': 'video',
      'imageUrl':
          'https://images.pexels.com/photos/1536619/pexels-photo-1536619.jpeg?auto=compress&cs=tinysrgb&w=600',
      'personName': 'Jane Smith',
    },
    {
      'posttype': 'influencer',
      'imageorvideo': 'image',
      'imageUrl':
          'https://images.pexels.com/photos/157675/fashion-men-s-individuality-black-and-white-157675.jpeg?auto=compress&cs=tinysrgb&w=600',
      'personName': 'John Doe',
    },
    {
      'posttype': 'influencer',
      'imageorvideo': 'image',
      'imageUrl':
          'https://images.pexels.com/photos/1021693/pexels-photo-1021693.jpeg?auto=compress&cs=tinysrgb&w=600',
      'personName': 'Jane Smith',
    },
    {
      'posttype': 'influencer',
      'imageorvideo': 'image',
      'imageUrl':
          'https://images.pexels.com/photos/833052/pexels-photo-833052.jpeg?auto=compress&cs=tinysrgb&w=600',
      'personName': 'John Doe',
    },
    {
      'posttype': 'influencer',
      'imageorvideo': 'video',
      'imageUrl':
          'https://images.pexels.com/photos/428340/pexels-photo-428340.jpeg?auto=compress&cs=tinysrgb&w=600',
      'personName': 'Jane Smith',
    },
    // Add more items as needed
  ];

  TabController? _tabController;

  // Dummy data for categories
  List<Category> categories = [
    Category(name: 'Fashion', tabIcon: Icon(Icons.category)),
    Category(name: 'Winter', tabIcon: Icon(Icons.category)),
    Category(name: 'Kids', tabIcon: Icon(Icons.category)),
    Category(name: 'Mens', tabIcon: Icon(Icons.category)),
    Category(name: 'Home', tabIcon: Icon(Icons.category)),
    Category(name: 'Travel', tabIcon: Icon(Icons.category)),

    // Add more categories as needed
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  void showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
            heightFactor: 0.9,
            child:
                FilterBottomSheetWidget()); // Return your custom bottom sheet widget
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                showFilterBottomSheet(context);
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
                        onPressed: () {},
                        icon: const Icon(Icons.tune_outlined),
                      ),
                    )
                  ],
                ),
              ),
            )),
        TabBar(
          controller: _tabController,
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey.shade600,
          indicatorSize: TabBarIndicatorSize.label,
          isScrollable: true,
          tabs: categories
              .map((category) => Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        category.tabIcon,
                        Text(category.name),
                      ],
                    ),
                  ))
              .toList(),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: dummyData.length,
              itemBuilder: (BuildContext context, int index) {
                return dummyData[index]['posttype'] == 'influencer'
                    ? InfluencerItem(
                        imageUrl: dummyData[index]['imageUrl'] ?? '',
                                                imageorvideo:dummyData[index]['imageorvideo'] ?? '',

                        personName: dummyData[index]['personName'] ?? '',
                      )
                    : BlogItem(
                        imageUrl: dummyData[index]['imageUrl'] ?? '',
                        imageorvideo:dummyData[index]['imageorvideo'] ?? '',
                        personName: dummyData[index]['personName'] ?? '');
              },
            ),
          ),
        ),
      ],
    ));
  }
}


