import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stud_bud/Pages/One_on_One_Chat/ChatRoom.dart';
import 'package:stud_bud/Pages/One_on_One_Chat/OChat.dart';

class TutorsList extends StatefulWidget {
  @override
  TutorsListState createState() => TutorsListState();
}

final _firestore = Firestore.instance;

class TutorsListState extends State<TutorsList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width - 150,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "List of Tutors",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChatRoom()));
                  },
                  icon: Icon(
                    Icons.chat,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(height: 40),
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('Users').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                final cards = snapshot.data.documents.reversed;
                List<TutorCards> tutorCards = [];
                for (var card in cards) {
                  String name = card.data()['Email'];
                  String select = card.data()['select'];
                  if (select == 'Tutor') {
                    final tutorCard = TutorCards(name: name);
                    tutorCards.add(tutorCard);
                  }
                }
                return Container(
                  width: 200,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.0, vertical: 2.0),
                          children: tutorCards,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TutorCards extends StatefulWidget {
  String name;
  TutorCards({this.name});
  @override
  TutorCardsState createState() => TutorCardsState();
}

class TutorCardsState extends State<TutorCards> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        elevation: 8,
        child: Container(
          height: 60,
          padding: EdgeInsets.only(left: 5, top: 5),
          child: Text(widget.name,
              style: TextStyle(color: Colors.black, fontSize: 16)),
        ));
  }
}
