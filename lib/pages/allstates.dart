import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_glow/flutter_glow.dart';


import 'package:http/http.dart' as http;
import 'dart:convert';

class AllState extends StatefulWidget {
  @override
  _AllStateState createState() => _AllStateState();
}

class _AllStateState extends State<AllState> {
  List allstate = [];
  Map allstate2 = {};

  Future fetchstateData() async {
    http.Response response;
    response = await http
        .get(Uri.parse('https://api.rootnet.in/covid19-in/stats/latest'));

    if (response.statusCode == 200) {
      setState(() {
        allstate2 = json.decode(response.body);
        allstate = allstate2['data']['regional'];
      });
    }
  }

  @override
  void initState() {
    

    fetchstateData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.redAccent[700],
        backgroundColor: Colors.deepPurpleAccent[700],
        title: GlowText(
          'Statewise Data',
          glowColor: Colors.white,
          style: GoogleFonts.alegreya(
              textStyle: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          )),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 600,
              child: ListView.builder(
                  itemCount: allstate.length,
                  shrinkWrap: false,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white70,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.lightGreenAccent.withOpacity(1),
                                  blurRadius: 30,
                                  offset: Offset(0, 10))
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(10,15,0,0),
                                      child: GlowText('${allstate[index]['loc']}',
                                          maxLines: 2,
                                          softWrap: true,
                                          overflow: TextOverflow.fade,
                                          glowColor: Colors.redAccent,
                                          style: GoogleFonts.alegreya(
                                              textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ))),
                                    ),
                                  ),
                                ],
                              ),


                               Row(
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(10,5,0,0),
                                      child: GlowText('Cases :  ${allstate[index]['totalConfirmed'].toString()}',
                                          maxLines: 2,
                                          softWrap: true,
                                          overflow: TextOverflow.fade,
                                          glowColor: Colors.black87,
                                          style: GoogleFonts.alegreya(
                                              textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ))),
                                    ),
                                  ),
                                ],
                              ),


                              Row(
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(10,5,0,0),
                                      child: GlowText('Recovered :  ${allstate[index]['discharged'].toString()}',
                                          maxLines: 2,
                                          softWrap: true,
                                          overflow: TextOverflow.fade,
                                          glowColor: Colors.lightGreenAccent[700],
                                          style: GoogleFonts.alegreya(
                                              textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ))),
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(10,5,0,0),
                                      child: GlowText('Deaths :  ${allstate[index]['deaths'].toString()}',
                                          maxLines: 2,
                                          softWrap: true,
                                          overflow: TextOverflow.fade,
                                          glowColor: Colors.redAccent[700],
                                          style: GoogleFonts.alegreya(
                                              textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ))),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),

            GlowButton(onPressed: () {},
            color: Colors.lightBlueAccent,
            
            child: GlowText('Summary',
            glowColor: Colors.yellowAccent,
            style: GoogleFonts.redressed(
              textStyle: TextStyle(
                color: Colors.pink,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )
            ),),
            )
          ],
        ),
      ),
    );
  }
}
