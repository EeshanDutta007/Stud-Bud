import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../authentication.dart';
import '../main.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

TextEditingController Parent1 = new TextEditingController();
TextEditingController Parent2 = new TextEditingController();
TextEditingController Tutor = new TextEditingController();

class _ProfileState extends State<Profile> {
  File _image;
  final picker = ImagePicker();
  String CircleAvtarLink = null;
  CollectionReference UserRefrance =
      FirebaseFirestore.instance.collection('ProfilePicUrl');

  Future<void> AddToFirestore(var url) {
    return UserRefrance.doc(email.substring(0, email.indexOf('@')))
        .set({
          'URL': url,
        })
        .then((value) => print('user added'))
        .catchError((error) => print('Failed to add User'));
  }

  Future<StorageUploadTask> uploadFile(BuildContext context) async {
    String fileName = path.basename(_image.path);
    StorageReference ref = FirebaseStorage.instance
        .ref()
        .child(email.substring(0, email.indexOf('@')))
        .child(fileName);
    StorageUploadTask uploadTask = ref.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    final url1 = await taskSnapshot.ref.getDownloadURL();
    //print(url1.toString());
    setState(() {
      CircleAvtarLink = url1.toString();
      AddToFirestore(url1);
    });
  }

  Future<void> getImageViaGallery() async {
    Navigator.pop(context);
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final croppedFile = await ImageCropper.cropImage(
        sourcePath: File(pickedFile.path).path,
      );
      setState(() {
        if (croppedFile != null) {
          _image = File(croppedFile.path);
          uploadFile(context);
        } else {
          print('No file selected');
        }
      });
    }
  }

  Future<void> getImageViaCamera() async {
    Navigator.pop(context);
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      final croppedFile = await ImageCropper.cropImage(
        sourcePath: File(pickedFile.path).path,
      );
      setState(() {
        if (croppedFile != null) {
          _image = File(croppedFile.path);
          uploadFile(context);
        } else {
          print('No file selected');
        }
      });
    } else {
      print('No file selected');
    }
  }

  String setImage() {
    String mainLink = null;
    UserRefrance.doc(email.substring(0, email.indexOf('@')))
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        var link = documentSnapshot.data()['URL'];
        print(link);
        setState(() {
          CircleAvtarLink = link.toString();
        });
        //  CircleAvtarImage=link.toString();
        print(CircleAvtarLink);
      } else {
        print('unsucsessful');
      }
    });
  }

  void displayBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            height: 150,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.camera),
                    title: Text('Camera'),
                    onTap: getImageViaCamera,
                  ),
                  ListTile(
                    leading: Icon(Icons.photo),
                    title: Text('Gallery'),
                    onTap: getImageViaGallery,
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    setImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    resizeToAvoidBottomInset:
    true;
    return SafeArea(
        child: Container(
      width: MediaQuery.of(context).size.width - 150,
      child: Column(
        children: [
          Center(
            child: Stack(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40.0),
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: CircleAvtarLink == null
                        ? NetworkImage(
                            'https://raw.githubusercontent.com/ParthPandey2236/Portfolio/master/images/profile.png')
                        : NetworkImage(CircleAvtarLink),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 100, left: 50),
                  child: ElevatedButton(
                    child: Container(
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.add_a_photo,
                          color: Colors.blue,
                        )),
                    onPressed: displayBottomSheet,
                    style: ElevatedButton.styleFrom(
                        primary: Colors.yellow, shape: CircleBorder()),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: TextField(
                  controller: Parent1,
                  decoration: InputDecoration(hintText: 'Parent1')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: TextField(
                  controller: Parent2,
                  decoration: InputDecoration(hintText: 'Parent2')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: TextField(
                  controller: Tutor,
                  decoration: InputDecoration(hintText: 'Tutor')),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              FirebaseAuth.instance.signOut();
              final prefs = await SharedPreferences.getInstance();
              prefs.remove('stud_bud_email');
              prefs.remove('student_tutor');
              main();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Authentication()));
            },
            child: Text('Logout'),
          )
        ],
      ),
    ));
  }
}
