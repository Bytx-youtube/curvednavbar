import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color background = Colors.redAccent;
  int currentIndex = 0;

  List<IconData> icon = [
    Icons.mail,
    Icons.home,
    Icons.favorite,
    Icons.person,
  ];

  List<String> title = [
    "Mail", "Home", "Favorite", "Profile"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: IndexedStack(
        index: currentIndex,
        children: [
          for(int i = 0; i < title.length; i++)...<Container>[
            Container(
              child: Center(
                child: Text(title[i]),
              ),
            ),
          ],
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: background,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          for(int i = 0; i < icon.length; i++)...<Icon>[
            Icon(
              icon[i],
              color: currentIndex == i ? background : Colors.black54,
            )
          ]
        ],
      ),
    );
  }
}
