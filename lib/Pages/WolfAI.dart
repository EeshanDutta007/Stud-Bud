import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

class Wolfframe extends StatefulWidget {
  @override
  _WolfframeState createState() => _WolfframeState();
}

class _WolfframeState extends State<Wolfframe> {

  String reply = "Any Queries ?";
  String picture = "";

  void searchQuery(String query) async {
    setState(() {
      reply = 'Searching...';
    });
    try {
      query.trim();
      query.replaceAll(' ', '%20');
      String txtURL = "http://api.wolframalpha.com/v2/query?appid=HKGA6W-AR9YHYHEHU&input=" + query + "&includepodid=Result&format=plaintext";
      String imgURL = "http://api.wolframalpha.com/v2/query?appid=HKGA6W-AR9YHYHEHU&input=" + query + "&includepodid=Result&format=image";
      try {
        var response = await http.get(txtURL);
        dom.Document document = parser.parse(response.body);
        var data = document.getElementById('Result').getElementsByTagName('plaintext')[0].innerHtml.split('</plaintext>')[0];
        setState(() {
          reply = data;
        });
        var image = await http.get(imgURL);
        dom.Document img = parser.parse(image.body);
        var imgData = img.getElementById('Result').getElementsByTagName('img')[0].attributes['src'];
        setState(() {
          picture = imgData;
        });
      } catch (e) {
        setState(() {
          reply = "I'm afraid, I don't know the answer to that question";
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1.75/3,
      height: MediaQuery.of(context).size.height * 6.5/10,
      decoration: BoxDecoration(
        color: Color(0xffededed),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.only(left: 12, right: 12),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Powered by Wolfram Alpha',
                    style: TextStyle(
                      color: Colors.blue,
                      letterSpacing: 2,
                      fontSize: 8.0,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ),
              ),
              Center(
                child: Stack(
                  children: [
                    Image(image: AssetImage('assets/wolf.png'), color: Colors.black12.withOpacity(0.1 )),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if(picture != "")
                            Center(child: Image.network(picture)),
                          Center(
                            child: Text(
                              reply,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 48,
                  color: Color(0xffededed),
                ),
              ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        )
                    ),
                    onSubmitted: (value) {
                      setState(() {
                        reply = "";
                        picture = "";
                      });
                      searchQuery(value);
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
