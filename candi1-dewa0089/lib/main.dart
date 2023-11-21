import 'package:flutter/material.dart';
import 'package:wisata_candi/screens/favorite_screen.dart';
import 'package:wisata_candi/screens/home_screen.dart';
import 'package:wisata_candi/screens/profile_screen.dart';
import 'package:wisata_candi/screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const HomeSceeen(),
      // home: const ProfileScreen(),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //TODO: 1 Deklarasikan variable
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeSceeen(),
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO:  2 Buat properti body berupa widget yang ditampilkan
      body: _children[_currentIndex],

      //TODO: 3 Buat properti bottomNavigasiBar dengan nilai Theme

      //TODO: 4 Buat data dan child dari Theme
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.deepPurple[50]),
        child: BottomNavigationBar(
            selectedItemColor: Colors.deepPurple,
            unselectedItemColor: Colors.deepPurple[100],
            showSelectedLabels: true,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              //Home
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.deepPurple,
                ),
                label: 'Home',
              ),
              //Search
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.deepPurple,
                ),
                label: 'Pencarian',
              ),
              //Favorite
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.deepPurple,
                ),
                label: 'Favorite',
              ),
              //Profile
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.deepPurple,
                ),
                label: 'Profile',
              )
            ]),
      ),
    );
  }
}
