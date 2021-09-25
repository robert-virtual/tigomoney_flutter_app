import 'package:flutter/material.dart';
import 'package:tigomoney/screens/envios.dart';
import 'package:tigomoney/screens/recargas_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: IndexedStack(
        index: currentPage,
        children: const [
          RecargasScreen(),
         EnviosScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (i) {
          setState(() {
            currentPage = i;
          });
        },
        items: const [
          BottomNavigationBarItem(label: 'Recargas', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Envios', icon: Icon(Icons.favorite))
        ],
      ),
    );
  }
}
