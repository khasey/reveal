import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reveal/constantColors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:action_slider/action_slider.dart';
import 'package:hexcolor/hexcolor.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  // Méthode pour ouvrir la galerie de photos
  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
    });
  }

  // Méthode pour ouvrir la caméra
  Future<void> _takePhoto() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Utiliser Stack pour superposer l'image de fond et le contenu
      body: Stack(
        children: [
          // Image en arrière-plan
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/back.png'), // Assurez-vous que l'image est bien dans le dossier assets
                fit: BoxFit.cover, // L'image couvre tout l'écran
              ),
            ),
          ),
          // Contenu de la page
          Padding(
            padding: const EdgeInsets.only(top:120.0, left: 16, right: 16),
            child: Column(
              children: [
                _buildProfileCard(context), // Profil avec stats
                const SizedBox(height: 10),
                _buildActionButtons(), // Boutons dans des containers avec dégradé
                const SizedBox(height: 10),
                _buildBoostSection(), // Section pour le boost premium
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Carte de profil avec avatar à gauche et stats à droite
  Widget _buildProfileCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8), // Légèrement transparent pour voir l'image de fond
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Avatar à gauche
          CircleAvatar(
            radius: 60,
            backgroundImage: _image != null
                ? FileImage(File(_image!.path))
                : const AssetImage("assets/selfie.png") as ImageProvider,
            backgroundColor: Colors.white,
          ),
          const SizedBox(width: 20),
          // Statistiques à droite de l'avatar
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "NOM PRENOM",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Age | Genre | Recherche",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              // Statistiques
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildStatsColumn("0", "Matchs"),
                  const SizedBox(width: 20),
                  _buildStatsColumn("0", "Messages"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget pour afficher les statistiques
  Widget _buildStatsColumn(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  // Section pour les boutons "Editer profil" et "Ajouter photos" avec un dégradé
  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionButton(
          icon: Icons.settings,
          text: "Editer le profil",
          onTap: () => _showEditProfileBottomSheet(context),
        ),
        _buildActionButton(
          icon: Icons.photo_camera,
          text: "Ajouter photos",
          onTap: () => _showImagePickerOptions(context),
        ),
      ],
    );
  }

  // Widget pour un bouton avec dégradé et icône
  Widget _buildActionButton({required IconData icon, required String text, required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width / 2.3,
        height: 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryColor.withOpacity(0.95),
              AppColors.primaryColor.withOpacity(0.98),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 30),
            const SizedBox(height: 10),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Section pour promouvoir le boost premium
  Widget _buildBoostSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor.withOpacity(0.95),
            AppColors.primaryColor.withOpacity(0.98),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.bolt_rounded,
                color: Colors.amber,
                size: 40,
              ),
              SizedBox(width: 10),
              Text(
                "Découvrir plus rapidement",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "Boost ton profil pour plus d'interactions.",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 2,
              fixedSize: const Size(200, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            onPressed: () {},
            child: Text(
              "Acheter",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Méthode pour afficher le bottom sheet pour éditer le profil
  void _showEditProfileBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          color: AppColors.primaryColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              textField("Nom"),
              textField("Prénom"),
              textField("Age"),
              textField("Genre"),
              textField("Recherche"),
              textField("Bio"),
              const SizedBox(height: 10),
              ActionSlider.standard(
                sliderBehavior: SliderBehavior.stretch,
                width: 300.0,
                backgroundColor: Colors.white,
                toggleColor: Colors.lightGreenAccent,
                action: (controller) async {
                  controller.loading();
                  await Future.delayed(const Duration(seconds: 3));
                  controller.success();
                  await Future.delayed(const Duration(seconds: 1));
                  controller.reset();
                },
                child: const Text('Slide pour valider'),
              ),
            ],
          ),
        );
      },
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
              _takePhoto();
            },
            child: const Text('Prendre une photo'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              _pickImage();
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

  // Widget pour un champ de texte personnalisé
  Widget textField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
          hintText: label,
          hintStyle: const TextStyle(color: Color.fromARGB(125, 255, 255, 255)),
        ),
      ),
    );
  }
}
