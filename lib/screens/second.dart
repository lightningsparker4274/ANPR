import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:numbers/screens/NumberPlateRecognizer.dart';
import 'package:google_ml_vision/google_ml_vision.dart';
import 'package:numbers/screens/number.dart';

void main() {
  // Lock the orientation to portrait mode only
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(Second());
}


class Second extends StatelessWidget  {
  final picker = ImagePicker();


  void handleCaptureImage(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      processImage(context,imageFile);
    }
  }
  void handleselectImage(BuildContext context) async{
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      processImage(context,imageFile);
    }
  }

  void processImage(BuildContext context, File imageFile) async {
    String numberPlateText = "";

    final visionImage = GoogleVisionImage.fromFile(imageFile);
    final textRecognizer = GoogleVision.instance.textRecognizer();

    try {
      final visionText = await textRecognizer.processImage(visionImage);
      numberPlateText = visionText.text ?? "";
    } catch (e) {
      // Show an error message if there was an error processing the image
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error processing image. Please try again."),
        ),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Number plate text: $numberPlateText"),
      ),
    );
    print("Number plate text: $numberPlateText");

    if (numberPlateText.isNotEmpty) {
      // Create the number.json file if it doesn't exist
      File jsonFile = File('assets/json/number.json');
      // Read the number.json file
      String jsonContent = await rootBundle.loadString('assets/json/number.json');
      List<dynamic> numberData = json.decode(jsonContent);

      // Search for the number plate details in the number.json file
      Map<String, dynamic>? numberPlateDetails = numberData.firstWhere(
            (data) => data['NumberPlate'] == numberPlateText,
        orElse: () => null,
      );

      if (numberPlateDetails != null) {
        // Start a new activity to display the number plate details
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NumberPlateActivity(
              numberPlateDetailsStr: json.encode(numberPlateDetails),
            ),
          ),
        );
      } else {
        // Show an error message if the number plate details are not found
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Number plate details not found."),
          ),
        );
      }
    } else {
      // Show an error message if the number plate is not detected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Number plate not detected."),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(appBar: AppBar(
      title: Text('Smart Agni Hackathon'),
    ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'A N P R ',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40),
              Text(
                'Accuracy & Reliable',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 350),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: () =>handleCaptureImage(context),
                    child: Text(
                      'Capture Image',

                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: () => handleselectImage(context),
                    child: Text(
                      'Scan Image',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
