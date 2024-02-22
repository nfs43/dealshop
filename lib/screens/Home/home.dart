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

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
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

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _scrollController.dispose();

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

// Function to scroll the ListView to the left
  void scrollListViewToLeft() {
    _scrollController.animateTo(
      _scrollController.offset -
          100, // You can adjust the scroll offset as needed
      curve: Curves.linear,
      duration: Duration(milliseconds: 500), // Adjust the duration as needed
    );
  }

  // Function to scroll the ListView to the right
  void scrollListViewToRight() {
    _scrollController.animateTo(
      _scrollController.offset +
          100, // You can adjust the scroll offset as needed
      curve: Curves.linear,
      duration: Duration(milliseconds: 500), // Adjust the duration as needed
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
        //HorizontalListView(),
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <InlineSpan>[
                            TextSpan(
                                text: 'Recommended Stores',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: black,
                                    fontSize: 16)),
                            const WidgetSpan(
                              child: SizedBox(
                                  width:
                                      5), // Adjust the width according to your preference
                            ),
                            TextSpan(
                                text: 'For You',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: black,
                                    fontSize: 20)),
                          ],
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero, 
                        onPressed: scrollListViewToLeft,
                        icon: Icon(Icons.arrow_back),
                      ),
                      IconButton(
                              constraints: const BoxConstraints(),
                          padding: EdgeInsets.zero, 
                        onPressed: scrollListViewToRight,
                        icon: Icon(Icons.arrow_forward),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 220,
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: dummyData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          right: 10.0,
                          bottom: 10.0,
                        ),
                        child: StoreItem(
                          imageUrl: dummyData[index]['imageUrl'] ?? '',
                          personName: dummyData[index]['personName'] ?? '',
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: RichText(
                    text: TextSpan(
                      children: <InlineSpan>[
                        TextSpan(
                            text: 'Just For',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: black,
                                fontSize: 20)),
                        const WidgetSpan(
                          child: SizedBox(
                              width:
                                  5), // Adjust the width according to your preference
                        ),
                        TextSpan(
                            text: 'You',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: black,
                                fontSize: 20)),
                      ],
                    ),
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
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
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

class StoreItem extends StatelessWidget {
  final String imageUrl;
  final String personName;

  const StoreItem({required this.imageUrl, required this.personName});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Card(
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(30.0), // Set the border radius here
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 60,
                  width: 160,
                ),
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'Target',
            style: TextStyle(color: black),
          ),
          SizedBox(height: 8.0),
          Text(
            'by 8:00 AM',
            style: TextStyle(color: textGrey),
          )
        ],
      ),
    );
  }
}