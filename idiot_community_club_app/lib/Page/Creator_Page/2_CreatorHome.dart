import 'dart:io';

import 'package:flutter/material.dart';
import 'package:idiot_community_club_app/Components/BarComponents.dart';
import 'package:idiot_community_club_app/Components/ButtonComponents.dart';
import 'package:idiot_community_club_app/Components/CardComponents.dart';
import 'package:image_picker/image_picker.dart';

// class CreatorHome extends StatelessWidget {
//   const CreatorHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp();
//   }
// }

class Communityhomecreate extends StatefulWidget {
  const Communityhomecreate({super.key});

  @override
  State<Communityhomecreate> createState() => _CommunityhomecreateState();
}

class _CommunityhomecreateState extends State<Communityhomecreate> {
  File? image;
  final ImagePicker _picker = ImagePicker(); // Initialize ImagePicker

  Future<void> _pickImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path); // Convert XFile to File
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Barcomponents.idiotBar(screen),
          SizedBox(height: 80),
          Cardcomponent.getMyOwnGradientBox(
            height: 480.0,
            width: 320.0,
            child: Column(
              children: [
                Text("Create a Community", style: Cardcomponent.clubTitleStyle),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: _pickImageFromGallery,
                              child: ClipOval(
                                child: Container(
                                  height: 105,
                                  width: 105,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child:
                                      image != null
                                          ? Image.file(
                                            image!,
                                            width: 200,
                                            height: 200,
                                          )
                                          : Image.asset(
                                            "assets/images/UploadImage.png",
                                          ),
                                  // child: Image.asset(
                                  //   "assets/images/UploadImage.png",
                                  // ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Community Name",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Description",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextFormField(
                        maxLines: 3,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: InkWell(
                          onDoubleTap: () {
                            Navigator.pushNamed(context, "/home");
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            child: ButtonComponents.getLogInBorder("Create"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Barcomponents.getIdiotNav(screen, context),
    );
  }
}
