import 'package:flutter/material.dart';
import 'package:wisata_candi/widgets/profil_info_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // TODO: 1 Deklarasikan variable yang dibutuhkan
  bool isSignedIn = true;
  String fullName = '';
  String userName = '';
  int favoriteCandiCount = 0;

  //TODO: 5 Implementasi fungsi signIn
  void signIn() {
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  //TODO: 6 Implementasi fungsi signOut
  void signOut() {
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.blue,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                //TODO: 2 Buat bagian ProfilHeader yang berisi gambar profil info
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200 - 50),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage('images/placeholder_image.png'),
                          ),
                        ),
                        if (isSignedIn)
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.camera_alt,
                                color: Colors.black,
                              ))
                      ],
                    ),
                  ),
                ),
                //TODO: 3 Buat bagian ProfileInfo yang berisi info profil

                // Pengguna
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  color: Colors.deepPurple,
                ),
                const SizedBox(
                  height: 4,
                ),
                ProfilInfoItem(
                    icon: Icons.lock,
                    label: 'Pengguna',
                    value: userName,
                    iconColor: Colors.amber),

                //Nama
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  color: Colors.deepPurple,
                ),
                const SizedBox(
                  height: 4,
                ),
                ProfilInfoItem(
                    icon: Icons.person,
                    label: 'Nama',
                    value: userName,
                    showEdition: isSignedIn,
                    iconColor: Colors.blue),

                // Favorite
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  color: Colors.deepPurple,
                ),
                const SizedBox(
                  height: 4,
                ),

                ProfilInfoItem(
                    icon: Icons.favorite,
                    label: 'Favorite',
                    value: favoriteCandiCount > 0 ? '$favoriteCandiCount' : '',
                    iconColor: Colors.red),

                //TODO: 4 Buat ProfilAction yang berisi TextButton sign in
                Padding(padding: EdgeInsets.all(8)),
                isSignedIn
                    ? TextButton(
                        onPressed: signOut,
                        child: const Text(
                          'Sign Out',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ))
                    : TextButton(
                        onPressed: signIn,
                        child: const Text('Signed In',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
