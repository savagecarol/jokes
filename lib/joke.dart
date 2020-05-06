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
  @override
  Widget build(BuildContext context)
  {
      return Scaffold(
          appBar: new AppBar(
              title:new Text("Aaaaaa",style:GoogleFonts.shadowsIntoLight(fontSize: 45,fontStyle:FontStyle.normal )) ,
              centerTitle: true,
          ),
          body:Container(
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
                                padding: const EdgeInsets.only(top:10,bottom:100,left:80,right: 80),
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
          )
      );
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




