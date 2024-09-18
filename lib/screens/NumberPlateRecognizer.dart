import 'package:flutter/material.dart';
import 'dart:convert';

class NumberPlateActivity extends StatefulWidget {
  final String numberPlateDetailsStr;
  NumberPlateActivity({required this.numberPlateDetailsStr});

  @override
  _NumberPlateActivityState createState() => _NumberPlateActivityState();
}

class _NumberPlateActivityState extends State<NumberPlateActivity> {
  late Map<String, dynamic> numberPlateDetails;
  int currentCardIndex = -1;
  List<Color> cardColors = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
  ];

  void _handleCardTap(int index) {
    setState(() {
      currentCardIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    // Parse the JSON string into a Map
    numberPlateDetails = jsonDecode(widget.numberPlateDetailsStr);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Number Plate Details'),
    ),
    body: ListView(
    padding: EdgeInsets.all(11.0),
    children: [
      Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          width: 300,
          height: 120,
          child: ListTile(
            leading: Icon(Icons.fifteen_mp_outlined ),
            title: Text(
              'Number Plate',
              style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
            ),

            subtitle:Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Text(
              numberPlateDetails['NumberPlate'],
              style: TextStyle(fontSize: 20.0),
            ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          ),
        ),
      ),
      SizedBox(height: 11.0,),
      Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          width: 300,
          height: 120,
          child: ListTile(
            leading: Icon(Icons.co_present_rounded  ),
            title: Text(
              'Owner',
              style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
            ),
            subtitle:Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Text(
              numberPlateDetails['Owner'],
              style: TextStyle(fontSize: 20.0),
            ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          ),
        ),
      ),
      SizedBox(height: 11.0,),
      Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          width: 300,
          height: 120,
          child: ListTile(
            leading: Icon(Icons.location_city),
            title: Text(
              'State',
              style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child:Text(
              numberPlateDetails['State'],
              style: TextStyle(fontSize: 20.0),
            ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          ),
        ),
      ),
      SizedBox(height: 11.0,),
      Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          width: 300,
          height: 120,
          child: ListTile(
            leading: Icon(Icons.construction_rounded),
            title: Text(
              'Make',
              style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
            ),
            subtitle:Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Text(
              numberPlateDetails['Make'],
              style: TextStyle(fontSize: 20.0),
            ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          ),
        ),
      ),
      SizedBox(height: 11.0,),
      Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          width: 300,
          height: 120,
          child: ListTile(
            leading: Icon(Icons.car_rental_sharp),
            title: Text(
              'Model',
              style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
            ),
            subtitle:Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Text(
              numberPlateDetails['Model'],
              style: TextStyle(fontSize: 20.0),
            ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          ),
        ),
      ),
      SizedBox(height: 11.0,),
      Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          width: 300,
          height: 120,
          child: ListTile(
            leading: Icon(Icons.calendar_month),
            title: Text(
              'Year',
              style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
            ),
            subtitle:Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Text(
              numberPlateDetails['Year'],
              style: TextStyle(fontSize: 20.0),
            ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          ),
        ),
      ),
      SizedBox(height: 11.0,),
      Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          width: 300,
          height: 120,
          child: ListTile(
            leading: Icon(Icons.event_busy),
            title: Text(
              'Insurance Expiry',
              style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 18.0),
            child:Text(
              numberPlateDetails['InsuranceExpiry'],
              style: TextStyle(fontSize: 20.0),
            ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          ),
        ),
      ),
    ]
    ));
  }
}
