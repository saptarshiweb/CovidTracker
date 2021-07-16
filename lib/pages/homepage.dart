import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map worlddata = {};

  Future fetchData() async {
    http.Response response;
    response = await http.get(Uri.parse('https://corona.lmao.ninja/v2/all'));

    if (response.statusCode == 200) {
      setState(() {
        worlddata = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'API Develop',
          style: GoogleFonts.alegreya(
              textStyle: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(worlddata['updated'].toString(),style: GoogleFonts.robotoCondensed(
                  textStyle: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 30,
                    
                  )
                ),)
          ],
        ),
      ),
    );
  }
}
