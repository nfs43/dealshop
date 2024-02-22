import 'package:dealshop/theme.dart';
import 'package:dealshop/widgets/HorizontalLine.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BlogDetail extends StatefulWidget {
  @override
  _BlogDetailState createState() => _BlogDetailState();
}

class _BlogDetailState extends State<BlogDetail> {
    bool _isLoading = true;

 @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: black,),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back when back button is pressed
          },
        ),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://basho.fueko.net/its-a-new-era-in-design-there-are-no-rules/', // Replace with your link
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (url) {
              setState(() {
                _isLoading = false;
              });
            },
          ),
          if (_isLoading)
            Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: CircularProgressIndicator(), // Loader widget
            ),
        ],
      ),
    );
  }
}