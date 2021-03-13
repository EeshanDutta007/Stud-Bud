import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Parafi extends StatefulWidget {
  @override
  _ParafiState createState() => _ParafiState();
}

class _ParafiState extends State<Parafi> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  FlutterTts flutterTts = FlutterTts();
  String document = '';
  String question = '';
  String answer = '';
  String status = 'Answer It';
  Future<void> loadQA(String doc, String query) async {
    setState(() {
      status = 'Searching...';
    });
    doc.trim();
    doc = doc + '&';
    query.trim();
    query = query;
    String QAurl = 'http://localhost:3333/?' + 'passage=' + doc + 'question=' + query;

    try {
      print('calling');
      Response response = await http.get(QAurl);
      print('called');
      dom.Document document = parser.parse(response.body);
      setState(() {
        answer = document.getElementsByTagName('h1')[0].innerHtml;
        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(answer)));
      });
    } catch (e) {
      setState(() {
        answer = "I'm afraid, I don't know the answer to that question";
        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(answer)));
      });
    }
    await flutterTts.setLanguage("en-US");
    await flutterTts.setVoice({"name": "Karen", "locale": "en-AU"});
    await flutterTts.setVolume(1.0);
    await flutterTts.speak("The answer is " + answer);
    setState(() {
      status = 'Answer It';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 1.88 / 3,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.only(left: 12, right: 12),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 72),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '    Powered by AI',
                            style: TextStyle(
                                color: Colors.greenAccent,
                                fontSize: 12,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Container(
                                  height: 40,
                                  width: 4,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2
                                  ),
                                  decoration: InputDecoration(
                                      hintText: 'Questions ??',
                                      border: InputBorder.none
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      question = value;
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 8),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                              minLines: 8,
                              maxLines: 12,
                              style: TextStyle(
                                  color: Colors.grey
                              ),
                              decoration: InputDecoration(
                                hintText: 'Provide Us With Some Docs...',
                                hintStyle: TextStyle(
                                    color: Colors.grey
                                ),
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                document = value;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: ElevatedButton(
                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue) ),
                              child: Text(
                                status,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2
                                ),
                              ),
                              onPressed: () {
                                loadQA(document, question);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
