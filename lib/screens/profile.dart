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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 50,
                  height: 50,
                  // color: Colors.amber,
                  child: Center(child: Icon(Icons.settings, color: Colors.white,)),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 50,
                  height: 50,
                  // color: Colors.amber,
                  child: Center(child: Icon(Icons.photo, color: Colors.white,)),
                ),
              ),
            ],
          ),
          ),
        ) 
    );
  }
}