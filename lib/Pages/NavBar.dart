import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:stud_bud/Pages/AR.dart';
import 'package:stud_bud/Pages/Chat.dart';
import 'package:stud_bud/Pages/FliptoFocus.dart';
import 'package:stud_bud/Pages/Parafi.dart';
import 'package:stud_bud/Pages/Profile.dart';
import 'package:stud_bud/Pages/WolfAI.dart';
import 'Chat.dart';
import 'One_on_One_Chat/OChat.dart';

class SideNavBar extends StatefulWidget {
  @override
  _SideNavBarState createState() => _SideNavBarState();
}

int _selectedIndex = 0;

class _SideNavBarState extends State<SideNavBar> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/Background.jpg'), fit: BoxFit.cover)),
        child: Scaffold(
            // appBar: AppBar(
            //   backgroundColor: Colors.transparent,
            //   elevation: 0,
            //   iconTheme: IconThemeData(color: Colors.black),
            // ),
            backgroundColor: Colors.transparent,
            body: Row(
              children: [
                SizedBox(height: height / 5),
                NavigationRail(
                  //elevation: 10,
                  leading: Column(
                    children: [
                      SizedBox(height: 20),
                    ],
                  ),
                  backgroundColor: Colors.white.withOpacity(0.6),
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  labelType: NavigationRailLabelType.selected,
                  minWidth: 20,
                  groupAlignment: -0.2,
                  selectedIconTheme: IconThemeData(color: Colors.blue),
                  unselectedIconTheme: IconThemeData(color: Colors.blue),
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.person),
                      selectedIcon: Icon(Icons.person),
                      label: Text(
                        "Profile",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.computer),
                      selectedIcon: Icon(Icons.computer_outlined),
                      label: Text("AR", style: TextStyle(color: Colors.blue)),
                    ),
                    NavigationRailDestination(
                        icon: Icon(Icons.book),
                        selectedIcon: Icon(Icons.book_outlined),
                        label: Text("Parafi",
                            style: TextStyle(color: Colors.blue))),
                    NavigationRailDestination(
                        icon: Icon(Icons.phone_android),
                        selectedIcon: Icon(Icons.phone_android_outlined),
                        label: Text("Flip-to-focus",
                            style: TextStyle(color: Colors.blue))),
                    NavigationRailDestination(
                        icon: Icon(Icons.chat_outlined),
                        selectedIcon: Icon(Icons.chat),
                        label: Text("Live-Connect",
                            style: TextStyle(color: Colors.blue))),
                    NavigationRailDestination(
                        icon: Icon(Icons.search),
                        selectedIcon: Icon(Icons.search),
                        label: Text("Wolf-AI",
                            style: TextStyle(color: Colors.blue))),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                (_selectedIndex == 0)
                    ? Profile()
                    : (_selectedIndex == 1)
                        ? AR()
                        : (_selectedIndex == 2)
                            ? Parafi()
                            : (_selectedIndex == 3)
                                ? FlipFocus()
                                : (_selectedIndex == 5)
                                    ? Wolfframe()
                                    : TutorsList(),
              ],
            )),
      ),
    );
  }
}
