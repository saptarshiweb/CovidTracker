import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:avatar_glow/avatar_glow.dart';

class HelpSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: GlowText('Contact Us',
            glowColor: Colors.yellow,
            style: GoogleFonts.alegreya(
                textStyle: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ))),
      ),
      body: Column(
        children: <Widget>[
         
          AvatarGlow(
            glowColor: Colors.deepOrange.shade700,
            endRadius: 90.0,
            duration: Duration(milliseconds: 2000),
            repeat: true,
            showTwoGlows: true,
            repeatPauseDuration: Duration(milliseconds: 100),
            child: Material(
              // Replace this child with your own
              elevation: 8.0,
              shape: CircleBorder(),
              child: CircleAvatar(
                backgroundColor: Colors.blueAccent[100],
                backgroundImage: AssetImage('assets/photome.jpg'),
                radius: 60,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Have an issue  or query? \nFeel free to contact us',
            textAlign: TextAlign.center,
            style: GoogleFonts.redressed(
                textStyle: TextStyle(
              fontSize: 28,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
            // style: TextStyle(fontSize: 20, color: Colors.grey[800]),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 120,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.deepPurpleAccent.withOpacity(1),
                          blurRadius: 30,
                          offset: Offset(0, 10))
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.email_rounded,
                        color: Colors.orange,
                        size: 30,
                      ),
                      Text(
                        'Write to us :',
                        style: GoogleFonts.redressed(
                            textStyle: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                      Text(
                        'sapmessi10@gmail.com',
                        style: GoogleFonts.firaSans(
                            textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 120,
                  width: 150,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.yellow.withOpacity(1),
                        blurRadius: 30,
                        offset: Offset(0, 10))
                  ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.phone,
                        color: Colors.orange,
                        size: 50,
                      ),
                      Text('Call us :',
                          style:  GoogleFonts.redressed(
                            textStyle: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),),
                      Text('9903178863',
                      style:  GoogleFonts.redressed(
                            textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),)
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 120,
                  width: 150,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.green.withOpacity(1),
                        blurRadius: 30,
                        offset: Offset(0, 10))
                  ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.help_outline,
                        color: Colors.orange,
                        size: 50,
                      ),
                      Text('FAQs :', style:  GoogleFonts.redressed(
                            textStyle: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),),
                      Text(
                        'Frequently asked questions',
                        style:  GoogleFonts.redressed(
                            textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 120,
                  width: 150,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.red.withOpacity(1),
                        blurRadius: 30,
                        offset: Offset(0, 10))
                  ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.orange,
                        size: 50,
                      ),
                      Text('Locate to us :',
                          style:  GoogleFonts.redressed(
                            textStyle: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),),
                      Text(
                        'Find us on Google Maps',
                        textAlign: TextAlign.center,
                        style:  GoogleFonts.redressed(
                            textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Copyright (c) 2021 Saptarshi Mandal',
            style: GoogleFonts.redressed(
                textStyle: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
          ),
          Text(
            'All rights reserved',
            style: GoogleFonts.redressed(
                textStyle: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )),
          ),
        ],
      ),
    );
  }
}
