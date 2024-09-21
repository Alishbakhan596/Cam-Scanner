import 'dart:io';

import 'package:cam_scanner/recognizer_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CamScanner extends StatefulWidget {
  const CamScanner({super.key});

  @override
  State<CamScanner> createState() => _CamScannerState();
}

class _CamScannerState extends State<CamScanner> {
  late ImagePicker imagePicker;
  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 50, bottom: 15, left: 5, right: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            color: Colors.blueAccent,
            child: Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    child: Column(
                      children: [
                        const Icon(Icons.scanner,
                            size: 25, color: Colors.white),
                        Text(
                          "Scan",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    child: Column(
                      children: [
                        const Icon(Icons.assessment_sharp,
                            size: 25, color: Colors.white),
                        Text(
                          "Recognize",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    child: Column(
                      children: [
                        const Icon(Icons.image_outlined,
                            size: 25, color: Colors.white),
                        Text(
                          "Enhance",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height - 300,
            ),
          ),
          Card(
            color: Colors.blueAccent,
            child: Container(
              height: 100,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: const Icon(Icons.rotate_left,
                          size: 35, color: Colors.white),
                      onTap: () {},
                    ),
                    InkWell(
                      child: const Icon(Icons.camera,
                          size: 50, color: Colors.white),
                      onTap: () {},
                    ),
                    InkWell(
                      child: const Icon(Icons.image_outlined,
                          size: 35, color: Colors.white),
                      onTap: () async {
                        XFile? xfile = await imagePicker.pickImage(
                            source: ImageSource.gallery);
                        if (xfile != null) {
                          File image = File(xfile.path);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecognizerScreen(image),
                              ));
                        }
                      },
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
