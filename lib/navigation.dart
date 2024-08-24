import 'package:flutter/material.dart';
import 'package:reveal/screens/acceuil.dart';
import 'package:reveal/screens/chat.dart';
import 'package:reveal/screens/profile.dart';
import 'package:reveal/screens/map.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
     final ThemeData theme = Theme.of(context);
     double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double padding = screenWidth * 0.03;
    double containerSize = screenWidth * 0.15;

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: const Color.fromARGB(255, 11, 11, 11),
       
        
        centerTitle: true,
        title: SvgPicture.asset(
          'assets/logo.svg',
          height: screenHeight * 0.05,
          alignment: Alignment.center,
        ),
        
      ),
      body: Stack(
        children: [
          <Widget>[
            /// Home page
            const Acceuil(),

            /// Map page
            const Map(),

            /// Chat page
            const Chat(),

            /// Profile page
            const Profile(),
          ][currentPageIndex],
          Positioned(
            bottom: 5,
            left: 20,
            right: 20,
            child: SafeArea(
              child: Container(
                height: 70,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: HexColor('#16171D'),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(40),
                ),
                child: NavigationBar(
                  onDestinationSelected: (int index) {
                    setState(() {
                      currentPageIndex = index;
                    });
                  },
                  backgroundColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  selectedIndex: currentPageIndex,
                  labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                  destinations: const <Widget>[
                    NavigationDestination(
                      selectedIcon:
                          Icon(Icons.auto_awesome_mosaic, color: Colors.white),
                      icon: Icon(Icons.auto_awesome_mosaic),
                      label: 'Home',
                    ),
                    NavigationDestination(
                      selectedIcon: 
                        Icon(Icons.place, color: Colors.white),
                      icon: Icon(Icons.place),
                      label: 'Maps',
                    ),
                    NavigationDestination(
                      selectedIcon: Badge(
                        label: Text('2', style: TextStyle(color: Colors.white)),
                        child: Icon(Icons.chat, color: Colors.white),
                      ),
                      icon: Badge(child: Icon(Icons.chat_bubble_outline)),
                      label: 'Chat',
                    ),
                    NavigationDestination(
                      selectedIcon:
                      Icon(Icons.person, color: Colors.white),
                      icon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}