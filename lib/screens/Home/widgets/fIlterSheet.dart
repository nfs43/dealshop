import 'package:dealshop/theme.dart';
import 'package:dealshop/widgets/HorizontalLine.dart';
import 'package:flutter/material.dart';

class FilterBottomSheetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  'Filters',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.0),
        Container(
          height: 1.0,
          color: Colors.grey,
        ),

        SizedBox(height: 8.0),
        Expanded(child: Container()),
        HorizontalLine(
          height: 1.0,
          color: Colors.grey,
        ),

        Container(
          margin: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Clear all',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  // Perform action when button is pressed
                },
                child: Container(
                    padding: EdgeInsets.all(20), child: Text('432 places')),
              ),
            ],
          ),
        ),
        // Add your filter options or additional content here
      ],
    );
  }
}
