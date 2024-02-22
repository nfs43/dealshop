import 'package:dealshop/providers/BottomBarProvider.dart';
import 'package:dealshop/routes/Routes.dart';
import 'package:dealshop/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoreDetail extends StatefulWidget {
  const StoreDetail({Key? key}) : super(key: key);

  @override
  _StoreDetailState createState() => _StoreDetailState();
}

class _StoreDetailState extends State<StoreDetail> {
  List<Map<String, List<Map<String, String>>>> mainDummyData = [
    {
      'Clothing': [
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
        // Add more store items as needed
      ],
    },
    {
      'Bags': [
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
        // Add more store items as needed
      ],
    },
    {
      'Shoes': [
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
        // Add more store items as needed
      ],
    },

    {
      'Cosmetics and Hygiene': [
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
        // Add more store items as needed
      ],
    },
    // Add more sections as needed
  ];

  late List<ScrollController> _scrollControllers;

  @override
  void initState() {
    super.initState();

    _scrollControllers = List.generate(
      mainDummyData.length,
      (_) => ScrollController(),
    );
  }

  @override
  void dispose() {
    for (var controller in _scrollControllers) {
      controller.dispose();
    }
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:[
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
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
           Expanded(
             child: ListView.builder(
                     itemCount: mainDummyData.length,
                     itemBuilder: (context, index) {
              String sectionTitle = mainDummyData[index].keys.first;
              List<Map<String, String>> stores =
                  mainDummyData[index][sectionTitle]!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          sectionTitle,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Text('View All',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.underline
                          ),)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      controller: _scrollControllers[index],
                      scrollDirection: Axis.horizontal,
                      itemCount: stores.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                            bottom: 10.0,
                          ),
                          child: StoreItem(
                            imageUrl: stores[index]['imageUrl'] ?? '',
                            personName: stores[index]['personName'] ?? '',
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
                     },
                   ),
           ),
        ]
      ),
    );
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
