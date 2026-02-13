import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/pages/shoping_cart.dart';
import 'package:flutter_application_1/pages/categoris_page.dart';
import 'package:flutter_application_1/utils/SizeOfConfig.dart';
import 'package:flutter_application_1/utils/wghit/custum_appbar.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _index = 0;

  final List<Widget> _pages = [
    Home(),
    CategorisPage(),
    ShopingCart(),
  ];

  final List<String> _titles = const [
    "الرئيسية",
    "الأصناف",
    "السلة",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: custumAppbar(context, _titles[_index]),
      endDrawer:  Directionality(
      textDirection: TextDirection.ltr,
      child: Drawer(
        backgroundColor: Colors.white,
        child: ListView(

          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Ramzi"),
              accountEmail: Text("r.y.thabit@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/personal_images/profilr.png',
                    width: getProportionalWidth(90),
                    height: getProportionalHeight(90),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration:  BoxDecoration(
                gradient: LinearGradient(
                    begin: AlignmentGeometry.centerLeft,
                    end: Alignment.centerRight,
                    colors: [ Theme.of(context).colorScheme.secondary, Theme.of(context).colorScheme.primary]

                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person,color: Theme.of(context).colorScheme.primary,),
              title: const Text('الملف الشخصي'),

              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart,color: Theme.of(context).colorScheme.primary),
              title: Text('الطلبات'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite,color: Theme.of(context).colorScheme.primary),
              title: Text('المفضلة'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings,color: Theme.of(context).colorScheme.primary),
              title: Text('الإعدادت'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.help,color: Theme.of(context).colorScheme.primary),
              title: Text('المساعدة و الدعم'),
              onTap: () {
                // Navigate to help page
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info,color: Theme.of(context).colorScheme.primary),
              title: Text('عنا'),
              onTap: () {
                // Navigate to about page
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.login,color: Theme.of(context).colorScheme.primary),
              title: Text('تسجيل الدخول'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder:
                        (context)=> loginpage()
                    )
                );
              },
            ),
          ],
        ),
      ),
    ),









      body: IndexedStack(
        index: _index,
        children: _pages,
      ),

      // 🔹 شريط تنقل عائم بتصميم احترافي
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 151, 146, 146),
            borderRadius: BorderRadius.circular(35),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home_rounded, 0),
              _buildNavItem(Icons.medical_services_rounded, 1), // أيقونة جديدة
              _buildNavItem(Icons.shopping_cart_rounded, 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    final bool isSelected = _index == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _index = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withOpacity(0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(
          icon,
          size: 28,
          color: isSelected 
              ? Theme.of(context).colorScheme.primary
              : const Color.fromARGB(255, 9, 9, 9),
        ),
      ),
    );
  }
}
