import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'joke.dart';
import 'package:http/http.dart' as  http;
import 'dart:async';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget
{
    @override
    Widget build(BuildContext context)
    {
        return MaterialApp(
            theme: ThemeData.dark(),
            home:HomePage()
        );

    }
}
final TextEditingController t1=new TextEditingController(text:"");
final TextEditingController t2=new TextEditingController(text:"");
String p=t1.text;
String q=t2.text;

class HomePage extends StatefulWidget
{
    @override
    _HomePageState createState()=> new _HomePageState();

}

class _HomePageState extends State<HomePage>
{

    _HomePageState();
    @override
    Widget build(BuildContext context)
    {
            return Scaffold(
                body:new Container(
                    padding: const EdgeInsets.only(top:50,bottom:100,left:80,right: 80),
                    child: Center(
                      child: SingleChildScrollView(
                        child: new Column(
                              children: <Widget>[
                        Text("Bitch Please",style:GoogleFonts.shadowsIntoLight(fontSize: 45,fontStyle:FontStyle.normal,fontWeight: FontWeight.bold )),
                        Padding(padding: const EdgeInsets.only(top:30)),
                        new TextFormField(
                            controller: t1,
                        decoration: new InputDecoration(
                        hintText: "First Name",
                        ),
                              keyboardType: TextInputType.text,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top:30),
                        ),
                        new TextFormField(
                            controller: t2,
                                decoration: new InputDecoration(
                          hintText: "Last Name"
                                ),
                                keyboardType: TextInputType.text,
                            ),
                            Padding(padding: const EdgeInsets.only(top:20)),
                        MaterialButton(child: new Text("Aww",style:GoogleFonts.shadowsIntoLight(fontSize: 40,fontStyle:FontStyle.italic,fontWeight: FontWeight.bold ) ),onPressed: (){
                            Navigator.of(context).push
                            (new MaterialPageRoute(builder:(BuildContext context)=> Joke()));}

                        ,),
                            ],
                        ),
                      )
                    ),
                ),
                resizeToAvoidBottomPadding: false,
            );

    }
    void _cle(){
        setState(() {
            t1.text="";
            t2.text="";

        });

    }


}
Future getJoke()
async {

    var data = await http.get(
        "http://api.icndb.com/jokes/random?firstName=John&amp;lastName=Doe1http://api.icndb.com/jokes/random?firstName=John&amp;lastName=Doe");
    var jsonData = json.decode(data.body);
    if (p!="" && q!=""
    ) {
        String str = jsonData["value"]["joke"];
        String l = str.replaceAll("&quot;", '"');
        String b = l.replaceAll("&quot;.", '"');
        String m = b.replaceAll("John", p);
        String k = m.replaceAll("Norris", q);
        return k;
    }
    else {
        String str = jsonData["value"]["joke"];
        String l = str.replaceAll("&quot;", '"');
        String b = l.replaceAll("&quot;.", '"');
        String m = b.replaceAll("John","Chandler" );
        String k = m.replaceAll("Norris", "Bing");
        return k;
    }

}

   // .split(" ",'(', ')', '?', ':', ';', ',', '.', '!', '/', '"', "'");