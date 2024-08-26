import 'package:flutter/material.dart';
import 'package:reveal/constantColors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: const AssetImage("assets/images/profile.jpg"),
              ),
              SizedBox(height: 15,), // This pushes the next widget to the bottom
              const Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Column(
                    children: [
                      Text(
                        "NOM PRENOM",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        "age | genre | recherche",
                        style: TextStyle(color: Colors.white, fontSize: 16),
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
                            height: MediaQuery.of(context).size.height * 0.7,
                            color: AppColors.primaryColor,
                            
                            child: Column(
                              children: [
                                textField("Nom"),
                                textField("Prénom"),
                                textField("Age"),
                                textField("Genre"),
                                textField("Recherche"),
                                textField("Bio"),
                                
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                        child: Center(
                            child: Icon(Icons.settings, color: Colors.black)),
                      ),
                    ),
                  ),
                  
                  GestureDetector(
                    onTap: () {
                      print("alex connard");
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                        child: Center(
                            child: Icon(Icons.photo, color: Colors.black)),
                      ),
                    ),
                  ),
                  
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Icon(Icons.photo_camera, color: AppColors.primaryColor, size: 40,),
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget textField(String text) {
    return Container(
      padding: const EdgeInsets.only(left: 16 , right: 16, top: 8),
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
          // suffixIcon: const Icon(Icons.edit, color: Colors.white),
          prefixIcon: const Icon(Icons.person, color: Colors.white),
          hintText: text,
          hintStyle: const TextStyle(color: Color.fromARGB(125, 255, 255, 255)),
        ),
      ),
    );
  }
}
