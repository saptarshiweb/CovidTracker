import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'contactus.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'countries.dart';
import 'allstates.dart';

class Mydrawer extends StatefulWidget {
  @override
  _MydrawerState createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  
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

  Map ind = {};
  Map ind2 = {};

  Future fetchindData() async {
    http.Response response;
    response = await http
        .get(Uri.parse('https://api.rootnet.in/covid19-in/stats/latest'));

    if (response.statusCode == 200) {
      setState(() {
        ind2 = json.decode(response.body);
        ind = ind2['data']['summary'];
      });
    }
  }

  // List countrydata = [];

  // Future fetchcountryData() async {
  //   http.Response response;
  //   response = await http
  //       .get(Uri.parse('https://corona.lmao.ninja/v2/countries?sort=cases'));

  //   if (response.statusCode == 200) {
  //     setState(() {
  //       countrydata = json.decode(response.body);
  //     });
  //   }
  // }

  List affcountry = [];

  Future fetchaffdata() async {
    http.Response response;
    response = await http
        .get(Uri.parse('https://corona.lmao.ninja/v2/countries?sort=cases'));

    if (response.statusCode == 200) {
      setState(() {
        affcountry = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    

    fetchData();
    fetchaffdata();
    fetchindData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 Tracker',
            style: GoogleFonts.redressed(
                textStyle: TextStyle(
              color: Colors.blue,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ))),
        backgroundColor: Colors.amberAccent,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              color: Colors.white70,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  AvatarGlow(
                    glowColor: Colors.red.shade900,
                    endRadius: 80.0,
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
                  GlowText('Saptarshi Mandal',
                      glowColor: Colors.blueAccent,
                      style: GoogleFonts.alegreya(
                          textStyle: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ))),
                  Divider(
                    height: 10,
                    thickness: 5,
                    color: Colors.deepPurple,
                    indent: 50,
                    endIndent: 50,
                  ),
                  ListTile(
                    leading: GlowIcon(
                      Icons.home,
                      glowColor: Colors.yellowAccent[700],
                      size: 50,
                      color: Colors.white70,
                    ),
                    title: GlowButton(
                        glowColor: Colors.orangeAccent[700],
                        color: Colors.white70,
                        child: GlowText(
                          'Home',
                          style: GoogleFonts.alegreya(
                              textStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                    onTap: () {
                      // Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: GlowIcon(
                      Icons.edit_location_alt_rounded,
                      glowColor: Colors.blueAccent[700],
                      size: 50,
                      color: Colors.white70,
                    ),
                    title: GlowButton(
                        glowColor: Colors.deepPurpleAccent[700],
                        color: Colors.white70,
                        child: GlowText(
                          'Countries',
                          style: GoogleFonts.alegreya(
                              textStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => World(),
                              ));
                        }),
                  ),
                  ListTile(
                    leading: GlowIcon(
                      Icons.contact_page_rounded,
                      glowColor: Colors.greenAccent[700],
                      size: 50,
                      color: Colors.white70,
                    ),
                    title: GlowButton(
                        glowColor: Colors.yellowAccent[700],
                        color: Colors.white70,
                        child: GlowText(
                          'Contact Us',
                          style: GoogleFonts.alegreya(
                              textStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HelpSection(),
                              ));
                        }),
                  ),
                  ListTile(
                    leading: GlowIcon(
                      Icons.map_sharp,
                      glowColor: Colors.redAccent[700],
                      size: 50,
                      color: Colors.white70,
                    ),
                    title: GlowButton(
                        glowColor: Colors.lightGreenAccent[700],
                        color: Colors.white70,
                        child: GlowText(
                          'Statewise Data',
                          style: GoogleFonts.alegreya(
                              textStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AllState(),
                              ));
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Container(
                    decoration:
                        BoxDecoration(color: Color(0x010E3311), boxShadow: [
                      BoxShadow(
                          color: Colors.redAccent.withOpacity(1),
                          blurRadius: 40,
                          offset: Offset(0, 10))
                    ]),
                    child: GlowText(
                      'COVID HOTSPOTS',
                      glowColor: Colors.red.shade700,
                      style: GoogleFonts.alegreya(
                          textStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
              child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.blueAccent.withOpacity(1),
                              blurRadius: 40,
                              offset: Offset(0, 10))
                        ],
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/covid.jpg"),
                        ))),
              ),
            ),
            SizedBox(height: 10),
            Divider(
              height: 10,
              thickness: 5,
              color: Colors.pink,
              indent: 50,
              endIndent: 50,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(1),
                        blurRadius: 30,
                        offset: Offset(0, 10))
                  ],
                ),
                child: Column(
                  children: [
                    GlowText(
                      'WORLDWIDE CASES',
                      glowColor: Colors.red.shade900,
                      style: GoogleFonts.alegreya(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                      child: Row(
                        children: [
                          Text(
                            'Confirmed :',
                            style: GoogleFonts.redressed(
                                textStyle: TextStyle(
                              color: Colors.blue,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                          GlowText(
                                  worlddata['cases'].toString(),
                                  glowColor: Colors.amber,
                                  style: GoogleFonts.redressed(
                                      textStyle: TextStyle(
                                    fontSize: 32,
                                    color: Colors.orangeAccent,
                                  )),
                                )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Row(
                        children: [
                          Text(
                            'Active :',
                            style: GoogleFonts.redressed(
                                textStyle: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                         
                               GlowText(
                                  worlddata['active'].toString(),
                                  glowColor: Colors.lightBlue,
                                  style: GoogleFonts.redressed(
                                      textStyle: TextStyle(
                                    fontSize: 35,
                                    color: Colors.indigo,
                                  )),
                                )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Row(
                        children: [
                          Text(
                            'Recovered :',
                            style: GoogleFonts.redressed(
                                textStyle: TextStyle(
                              color: Colors.lightGreen,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                          GlowText(
                                  worlddata['recovered'].toString(),
                                  glowColor: Colors.green,
                                  style: GoogleFonts.redressed(
                                      textStyle: TextStyle(
                                    fontSize: 35,
                                    color: Colors.green,
                                  )),
                                )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Row(
                        children: [
                          Text(
                            'Confirmed :',
                            style: GoogleFonts.redressed(
                                textStyle: TextStyle(
                              color: Colors.blue,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                         GlowText(
                                  worlddata['cases'].toString(),
                                  glowColor: Colors.amber,
                                  style: GoogleFonts.redressed(
                                      textStyle: TextStyle(
                                    fontSize: 35,
                                    color: Colors.orangeAccent,
                                  )),
                                )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Row(
                        children: [
                          Text(
                            'Deaths :',
                            style: GoogleFonts.redressed(
                                textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                         GlowText(
                                  worlddata['cases'].toString(),
                                  glowColor: Colors.black,
                                  style: GoogleFonts.redressed(
                                      textStyle: TextStyle(
                                    fontSize: 35,
                                    color: Colors.red,
                                  )),
                                )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),

            GlowText('India',
                glowColor: Colors.blue,
                style: GoogleFonts.alegreya(
                    textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                ))),
            SizedBox(height: 10),
            Row(
              children: [
                // GlowText('Statistics :',
                //         style: GoogleFonts.redressed(
                //             textStyle: TextStyle(
                //           fontSize: 25,
                //           fontWeight: FontWeight.bold,
                //           color: Colors.white,
                //         ))),

                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: GlowText('Statistics : ',
                      style: GoogleFonts.alegreya(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                SizedBox(width: 10),
                GlowButton(
                    height: 50,
                    width: 158,
                    child: GlowText('Statewise Data',
                        glowColor: Colors.green,
                        style: GoogleFonts.redressed(
                            textStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ))),
                    glowColor: Colors.orange,
                    color: Colors.amberAccent,
                    splashColor: Colors.green,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllState(),
                          ));
                    })
              ],
            ),

            SizedBox(height: 50),

            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
              child: Row(
                children: [
                  GlowText(
                    'Total Cases :   ' + ind['total'].toString(),
                    glowColor: Colors.black,
                    style: GoogleFonts.redressed(
                        textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    )),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
              child: Row(
                children: [
                  GlowText(
                    'Recovered : ' + ind['discharged'].toString(),
                    glowColor: Colors.yellowAccent,
                    style: GoogleFonts.redressed(
                        textStyle: TextStyle(
                      color: Colors.lightGreenAccent,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    )),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
              child: Row(
                children: [
                  GlowText(
                    'Deaths : ' + ind['deaths'].toString(),
                    glowColor: Colors.redAccent[700],
                    style: GoogleFonts.redressed(
                        textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    )),
                  )
                ],
              ),
            ),

            SizedBox(height: 30),

            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_downward_rounded,
                  size: 50,
                )),
            SizedBox(height: 20),
            GlowText(
              'Most Affected Countries',
              glowColor: Colors.orange,
              style: GoogleFonts.redressed(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 10,
            ),

            GlowText(
              'Scroll to view',
              style: GoogleFonts.alegreya(
                  textStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
            ),
            SizedBox(height: 30),
            // MostCountry(),

            SizedBox(
              height: 300,
              child: ListView.builder(
                shrinkWrap: false,
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: affcountry.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                      child: Container(
                        height: 230,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(1),
                                blurRadius: 30,
                                offset: Offset(0, 10))
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 10, 5, 0),
                                  child: Image(
                                    image: NetworkImage(
                                        '${affcountry[index]['countryInfo']['flag']}'),
                                    height: 50,
                                    width: 90,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 0, 0),
                                  child: GlowText(
                                      '${affcountry[index]['country']}',
                                      glowColor: Colors.black87,
                                      style: GoogleFonts.redressed(
                                          textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                      ))),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: GlowText(
                                    'Cases : ${affcountry[index]['cases'].toString()}',
                                    glowColor: Colors.red.shade900,
                                    style: GoogleFonts.alegreya(
                                        textStyle: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    )),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: GlowText(
                                    'Deaths : ${affcountry[index]['deaths'].toString()}',
                                    glowColor: Colors.black,
                                    style: GoogleFonts.alegreya(
                                        textStyle: TextStyle(
                                      color: Colors.red,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    )),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: GlowText(
                                    'Recovered : ${affcountry[index]['recovered'].toString()}',
                                    glowColor: Colors.green,
                                    style: GoogleFonts.alegreya(
                                        textStyle: TextStyle(
                                      color: Colors.lightGreen,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
