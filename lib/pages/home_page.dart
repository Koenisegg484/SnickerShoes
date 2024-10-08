import 'package:flutter/material.dart';
import 'package:snicker_shoes/pages/Products_list.dart';
import 'package:snicker_shoes/pages/carts_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [ProductsList(), CartsPage()];
  int currentpage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Snickers"),
          leading: const Icon(
            Icons.snowshoeing,
            color: Colors.purple,
          ),
          toolbarHeight: 90,
          shape: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.amberAccent,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          shadowColor: Colors.purple,
          backgroundColor: Theme.of(context).appBarTheme.foregroundColor
        ),
        body: IndexedStack(
          index: currentpage,
          children: pages,
        ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
          setState(() {
            currentpage = value;
            });
          },
          iconSize: 40,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          currentIndex: currentpage,
          items: [
            BottomNavigationBarItem(icon: Icon(
              Icons.home_rounded),
              label: "",

            ),
            BottomNavigationBarItem(icon: Icon(
              Icons.shopping_cart_rounded),
              label: "",

            ),
      ]),
    );
  }
}