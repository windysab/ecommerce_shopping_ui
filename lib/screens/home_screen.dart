import 'package:ecommerce_shopping_ui/screens/home_screen1.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  final int _pageIndex = 0;
  late List<Widget> _screens;
  @override
  void initState() {
    super.initState();
    _screens = [
      const Home_Screen1(),
      const Home_Screen1(),
      const Home_Screen1(),
      const Home_Screen1(),
      const Center(
        child: Text("DP SHOPPING"),
      ),
    ];
  }

  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DP SHOPPING"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("DP SHOPPING"),
              accountEmail: Text("Windy Sabtami "),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Home_Screen1(),
                  ),
                );
              },
              leading: const Icon(Icons.home),
              title: const Text("Home"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.person),
              title: const Text("My Account"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.shopping_cart),
              title: const Text("My Orders"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.category),
              title: const Text("Categories"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.favorite),
              title: const Text("Favorites"),
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.help),
              title: const Text("Help"),
            ),
          ],
        ),
      ),
      body: const Center(
        
      ),
    );
  }
}
