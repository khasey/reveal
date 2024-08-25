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
          height: MediaQuery.of(context).size.height * 0.71,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            color: AppColors.primaryColor,
                            child: const Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.person, color: Colors.white),
                                  title: Text("Edit pseudo", style: TextStyle(color: Colors.white)),
                                ),
                                ListTile(
                                  leading: Icon(Icons.edit, color: Colors.white),
                                  title: Text("Edit genre", style: TextStyle(color: Colors.white)),
                                ),
                                ListTile(
                                  leading: Icon(Icons.edit, color: Colors.white),
                                  title: Text("Edit age", style: TextStyle(color: Colors.white)),
                                ),
                                ListTile(
                                  leading: Icon(Icons.edit, color: Colors.white),
                                  title: Text("Edit recherche genre", style: TextStyle(color: Colors.white)),
                                ),
                                ListTile(
                                  leading: Icon(Icons.edit, color: Colors.white),
                                  title: Text("Edit age", style: TextStyle(color: Colors.white)),
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
                        child: Center(child: Icon(Icons.settings, color: Colors.white)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 50,
                        height: 50,
                        child: Center(child: Icon(Icons.photo, color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
              
              const Spacer(), // This pushes the next widget to the bottom
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
            ],
          ),
        ),
      ),
    );
  }
}
