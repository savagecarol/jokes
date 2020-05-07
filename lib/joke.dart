import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'main.dart';
import 'package:google_fonts/google_fonts.dart';


class Joke extends StatefulWidget
{
    @override
    _JokeState createState()=> new _JokeState();

}

class _JokeState extends State<Joke>
{

    Future<Null> refreshList() async{
        await Future.delayed(Duration(seconds: 2));
        setState(() {
        });
        return null;
    }
  @override
  Widget build(BuildContext context)
  {
      return Scaffold(
          appBar: new AppBar(
              title:new Text("Aaaaaa",style:GoogleFonts.shadowsIntoLight(fontSize: 45,fontStyle:FontStyle.normal )) ,
              centerTitle: true,
          ),
            drawer: new Drawer(
            child:new ListView(
                children: <Widget>[
                    new ListTile(
                        title: Center(child: Text("If you want to change name",style:GoogleFonts.shadowsIntoLight(fontSize: 22,fontStyle:FontStyle.normal,fontWeight: FontWeight.bold ),)),
                    ),
                    new ListTile(
                       title: Center(child: Text("Bitch Please",style:GoogleFonts.shadowsIntoLight(fontSize: 30,fontStyle:FontStyle.normal,fontWeight: FontWeight.bold ),)),
                    ),
                    new ListTile(
                        title: new Column(
                            children: <Widget>[
                                new TextFormField(
                                    controller: t3,
                                    decoration: new InputDecoration(
                                        hintText: "First Name",
                                    ),
                                    keyboardType: TextInputType.text,
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top:30),
                                ),
                                new TextFormField(
                                    controller: t4,
                                    decoration: new InputDecoration(
                                        hintText: "Last Name"
                                    ),
                                    keyboardType: TextInputType.text,
                                ),
                                Padding(padding: const EdgeInsets.only(top:20)),
                                MaterialButton(child: new Text("Aww",style:GoogleFonts.shadowsIntoLight(fontSize: 25,fontStyle:FontStyle.italic,fontWeight: FontWeight.bold,color: Colors.white ) ),
                                onPressed:() {
                                  two();
                                },)
                            ],
                        ),
                    ),

                    new ListTile(
                        title: new Text("close",style:GoogleFonts.shadowsIntoLight(fontSize: 22,fontStyle:FontStyle.italic,fontWeight: FontWeight.bold,color: Colors.white )),
                        trailing: new Icon(Icons.close),
                        onTap:()=> Navigator.of(context).pop(),
                    ),

                ],
            )
            ),
            body: RefreshIndicator(
                backgroundColor: Colors.grey[700],
                onRefresh: refreshList,
              child: ListView.builder(itemCount: 1,
                  itemBuilder: (context,i)=>
                   Container(
                    padding: const EdgeInsets.only(top:20,bottom:100,left:80,right: 80),
                  child: Column(
                    children: <Widget>[
                      FutureBuilder
                          (
                          future: getJoke(),
                          builder: (BuildContext context, AsyncSnapshot snapshot)
                          {
                              if (snapshot.data == null)
                              {
                                  return Container(
                                      padding: const EdgeInsets.only(top:150,bottom:100,left:80,right: 80),
                                    child: SpinKitRing(
                                        size: 40,
                                        color: Colors.white,
                                    ),
                                  );
                              }
                              else
                              {
                                  return hy("${snapshot.data}");
                                  }
                          }
                      ),
                    ],
                  ),
                ),
              ),
            ),
      );
  }


    void two(){
        setState(() {
            if  (t3.text!="" && t4.text!="" || t3.text=="" && t4.text!=""|| t3.text!="" && t4.text=="") {
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
                                        Navigator.of(context).pop();
                                    },
                                ),
                                Padding(padding:EdgeInsets.only(right:70,bottom:30),)
                                ,FlatButton(
                                    child: Text('Okay',style:GoogleFonts.shadowsIntoLight(fontSize: 30,fontStyle:FontStyle.italic,fontWeight: FontWeight.bold )),color: Colors.grey[700],
                                    onPressed: () {
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
Center hy(String s)
{
    return Center(
      child: Column(
          children: <Widget>[
              Padding(padding: const EdgeInsets.only(bottom:50,left:80,right: 80),),
          Text(
          s,
          style:GoogleFonts.shadowsIntoLight(fontSize: 26,fontStyle:FontStyle.normal,fontWeight: FontWeight.w500),
          )
          ],

          ),
    );
}



