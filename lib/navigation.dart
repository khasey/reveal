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
  int currentPageIndex = 0; // Variable pour contrôler la page active

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Contenu principal (les différentes pages)
          <Widget>[
            const Acceuil(),
            const Map(),
            const Chat(),
            const Profile(),
          ][currentPageIndex],

          // Afficher le logo si la page active n'est pas la page Map (index 1)
          if (currentPageIndex != 1)
            Positioned(
              top: 70, // Distance par rapport au haut de l'écran
              left: 0,
              right: 0,
              child: Center(
                child: SvgPicture.asset(
                  'assets/logo2.svg',
                  height: screenHeight * 0.05, // Taille du logo
                  alignment: Alignment.center,
                ),
              ),
            ),

          // Barre de navigation en bas
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
                      selectedIcon: Icon(Icons.auto_awesome_mosaic,
                          color: Colors.white),
                      icon: Icon(Icons.auto_awesome_mosaic),
                      label: 'Home',
                    ),
                    NavigationDestination(
                      selectedIcon: Icon(Icons.place, color: Colors.white),
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
                      selectedIcon: Icon(Icons.person, color: Colors.white),
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
