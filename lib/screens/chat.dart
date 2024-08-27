import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Container(
        // Utilisation de BoxDecoration pour ajouter l'image en arrière-plan
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/back.png'), // Assure-toi que l'image est dans le bon chemin
            fit: BoxFit.cover, // Pour que l'image prenne tout l'espace en conservant son ratio
          ),
        ),
        child: const Center(
          child: Text(
            "Chat",
            style: TextStyle(
              color: Colors.white, // Couleur blanche pour contraster avec l'arrière-plan
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}