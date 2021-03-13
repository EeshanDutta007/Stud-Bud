import 'package:flutter/material.dart';
import 'package:stud_bud/Pages/AR.dart';
import 'package:stud_bud/Pages/FliptoFocus.dart';
import 'package:stud_bud/Pages/Parafi.dart';
import 'package:stud_bud/Pages/Profile.dart';
import 'package:stud_bud/Pages/WolfAI.dart';

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
      child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   elevation: 0,
          //   iconTheme: IconThemeData(color: Colors.black),
          // ),
          backgroundColor: Colors.white,
          body: Row(
            children: [
              SizedBox(height: height / 5),
              NavigationRail(
                elevation: 10,
                leading: Column(
                  children: [
                    SizedBox(height: 20),
                  ],
                ),
                backgroundColor: Colors.white,
                selectedIndex: _selectedIndex,
                onDestinationSelected: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                labelType: NavigationRailLabelType.selected,
                minWidth: 20,
                groupAlignment: -0.2,
                destinations: [
                  NavigationRailDestination(
                      icon: CircleAvatar(
                        backgroundColor: Colors.red,
                      ),
                      selectedIcon: CircleAvatar(
                        backgroundColor: Colors.red,
                      ),
                      label: Text("Name")),
                  NavigationRailDestination(
                      icon: Icon(Icons.computer),
                      selectedIcon: Icon(Icons.computer_outlined),
                      label: Text("AR")),
                  NavigationRailDestination(
                      icon: Icon(Icons.book),
                      selectedIcon: Icon(Icons.book_outlined),
                      label: Text("Parafi")),
                  NavigationRailDestination(
                      icon: Icon(Icons.phone_android),
                      selectedIcon: Icon(Icons.phone_android_outlined),
                      label: Text("Flip-to-focus")),
                  NavigationRailDestination(
                      icon: Icon(Icons.chat_outlined),
                      selectedIcon: Icon(Icons.chat),
                      label: Text("Live-Connect")),
                  NavigationRailDestination(
                      icon: Icon(Icons.search),
                      selectedIcon: Icon(Icons.search),
                      label: Text("Wolf-AI")),
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
                                  : Center(child: Text("Chat")),
            ],
          )),
    );
  }
}
