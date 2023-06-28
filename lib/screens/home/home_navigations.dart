import 'package:education_app/constant/colors.dart';
import 'package:education_app/screens/categories/categories.dart';
import 'package:education_app/screens/favourite/favourite.dart';
import 'package:education_app/screens/home/home_screen.dart';
import 'package:education_app/screens/profile/profile.dart';
import 'package:education_app/widgets/setting_item.dart';
import 'package:flutter/material.dart';

class HomeNavigation extends StatefulWidget {
  HomeNavigation({Key? key, this.index}) : super(key: key);
  int? index;
  @override
  _HomeNavigationState createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [];

  @override
  void initState() {
    _widgetOptions = [
      HomeScreen(
        callBack: onTabTapped,
      ),
      const CategoriesScreen(),
      const FavouriteScreen(),
      const ProfileScreen(),
    ];
    _selectedIndex = widget.index ?? 0;
    super.initState();
  }

  void onTabTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: <Widget>[
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notification_add,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          )
        ],
        backgroundColor: EducationAppColors.appColor,
      ),
      drawer: Drawer(
        child: getDrawer(),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: EducationAppColors.bottomTapColor,
        elevation: 16,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: EducationAppColors.appColor,
        unselectedItemColor: EducationAppColors.bottomTapUnselectedColor,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/home.png",
              width: 25,
              height: 23,
            ),
            activeIcon: Image.asset(
              "assets/home.png",
              width: 25,
              height: 23,
              color: EducationAppColors.appColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/categories.png",
              width: 25,
              height: 23,
            ),
            activeIcon: Image.asset(
              "assets/categories.png",
              width: 25,
              height: 23,
              color: EducationAppColors.appColor,
            ),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/favourite.png",
              width: 25,
              height: 23,
            ),
            activeIcon: Image.asset(
              "assets/favourite.png",
              width: 25,
              height: 23,
              color: EducationAppColors.appColor,
            ),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/account.png",
              width: 30,
              height: 28,
            ),
            activeIcon: Image.asset(
              "assets/account.png",
              width: 30,
              height: 28,
              color: EducationAppColors.appColor,
            ),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }

  Widget getDrawer() {
    return SafeArea(
      child: Drawer(
        child: Column(children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SettingItem(
                    title: "Syllabus",
                    leadingIcon: "assets/ic_bookmarks.png",
                    onTap: () {},
                  ),
                ),
                Divider(
                  height: 0,
                  color: Colors.grey.withOpacity(0.8),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SettingItem(
                    title: "Notifications",
                    leadingIcon: "assets/ic_notifications.png",
                    onTap: () {},
                  ),
                ),
                Divider(
                  height: 0,
                  color: Colors.grey.withOpacity(0.8),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SettingItem(
                    title: "Privacy Policy",
                    leadingIcon: "assets/ic_privacypolicy.png",
                    onTap: () {},
                  ),
                ),
                Divider(
                  height: 0,
                  color: Colors.grey.withOpacity(0.8),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SettingItem(
                    title: "Course",
                    leadingIcon: "assets/ic_rate_the_app.png",
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
