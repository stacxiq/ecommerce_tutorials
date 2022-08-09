import 'package:ecommerce_tutorials/pages/account.dart';
import 'package:ecommerce_tutorials/pages/cart.dart';
import 'package:ecommerce_tutorials/pages/category/category.dart';
import 'package:ecommerce_tutorials/pages/home/home.dart';
import 'package:ecommerce_tutorials/pages/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TabsPage extends StatefulWidget {
  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _current = 0;

  List<Widget> _pages = [
    HomePage(),
    CategoryPage(),
    WishListPage(),
    CartPage(),
    AccountPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_current],
      bottomNavigationBar: SafeArea(
        child: BottomNavigationBar(
          elevation: 0,
          iconSize: 27,
          onTap: (int index) {
            setState(() {
              _current = index;
            });
          },
          selectedFontSize: 16,
          unselectedFontSize: 14,
          type: BottomNavigationBarType.fixed,
          currentIndex: _current,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.red.withOpacity(0.5),
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Iconsax.home,
                ),
                label: 'الرئيسية'),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.grid_1),
              label: 'الاصناف',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.shopping_bag1),
              label: 'المفضلات',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.shopping_cart),
              label: 'السلة',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.user),
              label: 'الحساب',
            ),
          ],
        ),
      ),
    );
  }
}
