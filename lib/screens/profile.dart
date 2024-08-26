import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reveal/constantColors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:action_slider/action_slider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  XFile? _image; // Variable pour stocker l'image sélectionnée

  final ImagePicker _picker = ImagePicker(); // Instance de ImagePicker

  // Méthode pour ouvrir la galerie de photos
  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
    });
  }

  // Méthode pour ouvrir la caméra
  Future<void> _takePhoto() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                // color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: _image != null
                        ? FileImage(File(_image!.path))
                        : const AssetImage("assets/selfie.png")
                            as ImageProvider,
                  ),
                  const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: Column(
                        children: [
                          Text(
                            "NOM PRENOM",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          Text(
                            "age | genre | recherche",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          Text(
                            "bio",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                color: AppColors.primaryColor,
                                child: Column(
                                  children: [
                                    textField("Nom"),
                                    textField("Prénom"),
                                    textField("Age"),
                                    textField("Genre"),
                                    textField("Recherche"),
                                    textField("Bio"),
                                    ActionSlider.standard(
                                      sliderBehavior: SliderBehavior.stretch,
                                      width: 300.0,
                                      backgroundColor: Colors.white,
                                      toggleColor: Colors.lightGreenAccent,
                                      action: (controller) async {
                                        controller
                                            .loading(); //starts loading animation
                                        await Future.delayed(
                                            const Duration(seconds: 3));
                                        controller
                                            .success(); //starts success animation
                                        await Future.delayed(
                                            const Duration(seconds: 1));
                                        controller.reset(); //resets the slider
                                      },
                                      child: const Text('Slide pour valider'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(
                                child:
                                    Icon(Icons.settings, color: Colors.black)),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _showImagePickerOptions(
                              context); // Affiche les options
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(
                                child: Icon(Icons.photo, color: Colors.black)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Align(
                  //   alignment: Alignment.bottomCenter,
                  //   child: Container(
                  //     width: 60,
                  //     height: 60,
                  //     decoration: BoxDecoration(
                  //       boxShadow: [
                  //               BoxShadow(
                  //                 color: Colors.black.withOpacity(0.3),
                  //                 spreadRadius: 1,
                  //                 blurRadius: 5,
                  //                 offset: const Offset(0, 1),
                  //               ),
                  //             ],
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(50),
                  //     ),
                  //     child: Center(
                  //       child: Icon(Icons.photo_camera,
                  //           color: AppColors.primaryColor, size: 40),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Expanded(
              flex: 1,
              child: Container(
                // color: AppColors.primaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bolt_rounded,
                          color: Colors.lightBlue,
                          size: 40,
                        ),
                        Text(
                          "Decouvrir plus rapidement",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    const Text(
                      "Boost ton profile pour plus d'interactions",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 1,
                        fixedSize: Size(200, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Acheter",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Méthode pour afficher les options de sélection (caméra ou galerie)
  void _showImagePickerOptions(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Choisissez une option'),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              _takePhoto(); // Ouvre la caméra
            },
            child: const Text('Prendre une photo'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              _pickImage(); // Ouvre la galerie
            },
            child: const Text('Choisir depuis la galerie'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Annuler'),
        ),
      ),
    );
  }

  Widget textField(String text) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
      child: TextField(
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          prefixIcon: const Icon(Icons.person, color: Colors.white),
          hintText: text,
          hintStyle: const TextStyle(color: Color.fromARGB(125, 255, 255, 255)),
        ),
      ),
    );
  }
}
