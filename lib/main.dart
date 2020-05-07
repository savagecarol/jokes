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
final TextEditingController t3=new TextEditingController(text:"");
final TextEditingController t4=new TextEditingController(text:"");
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
//                            Navigator.of(context).pop();
//                            Navigator.of(context).push
//                            (new MaterialPageRoute(builder:(BuildContext context)=> Joke()));
                        one();
                          }

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
    void one(){
        setState(() {
            if  (t1.text!="" && t2.text!="" || t1.text!="" && t2.text=="" || t1.text=="" && t2.text!="") {
            Navigator.of(context).pop();
            Navigator.of(context).push
                (new MaterialPageRoute(builder:(BuildContext context)=> Joke()));}
            else{
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                            return AlertDialog(
                                backgroundColor: Colors.grey[900],
                                title: Text(" If you Enter Nothing You will get Chandler Bing's Jokes  ",style:GoogleFonts.shadowsIntoLight(fontSize: 22)),
                                actions: <Widget>[
                                    FlatButton(
                                    child: Text('Back',style:GoogleFonts.shadowsIntoLight(fontSize: 30,fontStyle:FontStyle.italic,fontWeight: FontWeight.bold )),color: Colors.grey[700],
                                    onPressed: () {
                                        _cle();
                                        Navigator.of(context).pop();
                                    },
                                ),
                                    Padding(padding:EdgeInsets.only(right:70,bottom:30),)
                                    ,FlatButton(
                                        child: Text('Okay',style:GoogleFonts.shadowsIntoLight(fontSize: 30,fontStyle:FontStyle.italic,fontWeight: FontWeight.bold )),color: Colors.grey[700],
                                        onPressed: () {
                                            _cle();
                                            Navigator.of(context).pop();
                                            Navigator.of(context).push
                                                (new MaterialPageRoute(builder:(BuildContext context)=> Joke()));

                                        },
                                    ),
                                    Padding(padding:EdgeInsets.only(right:30,bottom: 30),)
                                ],
                            );
                        });
                }
        });

    }


}





Future getJoke()
async {

    var data = await http.get(
        "http://api.icndb.com/jokes/random?firstName=John&amp;lastName=Doe1http://api.icndb.com/jokes/random?firstName=John&amp;lastName=Doe");
    var jsonData = json.decode(data.body);
    String str = jsonData["value"]["joke"];
    String l = str.replaceAll("&quot;", '"');
    String b = l.replaceAll("&quot;.", '"');

    if ((p!="" && q!="" || p!="" && q=="" ||  p=="" && q!="") && t3.text=="" && t4.text=="") {
        if (p == t1.text && q == t2.text) {
            String m = b.replaceAll("John", p);
            String k = m.replaceAll("Norris", q);
            return k;
        }
        else
        {
            String m = b.replaceAll("John","Chandler");
            String k = m.replaceAll("Norris","Bing" );
            return k;
        }
    }
    else if(p=="" && q=="" && t3.text=="" && t4.text=="")
    {
        String m = b.replaceAll("John","Chandler" );
        String k = m.replaceAll("Norris", "Bing");
        return k;
    }
    else if(t3.text!="" && t4.text!="" ||t3.text!="" && t4.text==""|| t3.text!="" && t4.text=="")
        {
            p=t3.text;
            q=t4.text;

            String m = b.replaceAll("John",p );
            String k = m.replaceAll("Norris",q);
            return k;
        }


}

   // .split(" ",'(', ')', '?', ':', ';', ',', '.', '!', '/', '"', "'");