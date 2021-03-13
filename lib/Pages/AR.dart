import 'package:flutter/material.dart';
import 'package:model_viewer/model_viewer.dart';

class AR extends StatefulWidget {
  @override
  _ARState createState() => _ARState();
}

class _ARState extends State<AR> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width - 130,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.blue[900],
                      elevation: 8,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Models(
                                  src:
                                      'https://storage.echoar.xyz/raspy-thunder-0385/44faa8a4-09df-419f-9a24-5b9fa9fc6930.glb',
                                )));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 2 - 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/Images/BLE.png'))),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.blue[900],
                      elevation: 8,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Models(
                                  src:
                                      'https://storage.echoar.xyz/raspy-thunder-0385/f0eebfe3-8494-4171-bc9e-354b4bd6033e.glb',
                                )));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 2 - 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/Images/Lungs.png'))),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.blue[900],
                      elevation: 8,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Models(
                                  src:
                                      'https://storage.echoar.xyz/raspy-thunder-0385/96d25b23-c8f8-4a08-a795-a1110cfd3981.glb',
                                )));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 2 - 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/Images/Heart.png'))),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.blue[900],
                      elevation: 8,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Models(
                                  src:
                                      'https://storage.echoar.xyz/raspy-thunder-0385/478beacb-0d0d-45a1-8c65-9fe4b7092954.glb',
                                )));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 2 - 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/Images/DNA.png'))),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.blue[900],
                      elevation: 8,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Models(
                                  src:
                                      'https://storage.echoar.xyz/raspy-thunder-0385/4d4f623c-b671-4bb3-ad4f-e9b4e4806ed0.glb',
                                )));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 2 - 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/Images/Computer.png'))),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.blue[900],
                      elevation: 8,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Models(
                                  src:
                                      'https://storage.echoar.xyz/raspy-thunder-0385/339b3968-4f86-4714-94e6-8fd0607a2a14.glb',
                                )));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 2 - 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/Images/Testosterone.png'))),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.blue[900],
                      elevation: 8,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Models(
                                  src:
                                      'https://storage.echoar.xyz/raspy-thunder-0385/005f1d2c-e071-4ebb-a04c-dd8ea44c14f0.glb',
                                )));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 2 - 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/Images/Brain.png'))),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.blue[900],
                      elevation: 8,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Models(
                                  src:
                                      'https://storage.echoar.xyz/raspy-thunder-0385/4bcb4574-1c63-4c18-a557-3932d5b7fb76.glb',
                                )));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 2 - 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/Images/PendulumString.png'))),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.blue[900],
                      elevation: 8,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Models(
                                  src:
                                      'https://storage.echoar.xyz/raspy-thunder-0385/13022b40-36b6-4f33-b205-80f7c34b9bee.glb',
                                )));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 2 - 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/Images/Beaker.png'))),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class Models extends StatefulWidget {
  final String src;

  const Models({Key key, this.src}) : super(key: key);

  @override
  _ModelsState createState() => _ModelsState();
}

class _ModelsState extends State<Models> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("AR Model"))),
      body: ModelViewer(
        backgroundColor: Colors.white,
        src: widget.src,
        alt: "3D Models",
        ar: true,
        autoRotate: true,
        cameraControls: true,
      ),
    );
  }
}
