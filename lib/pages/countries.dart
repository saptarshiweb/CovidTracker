import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dio/dio.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_glow/flutter_glow.dart';

class World extends StatefulWidget {
  @override
  _WorldState createState() => _WorldState();
}

class _WorldState extends State<World> {
  Future onRefresh() async {
     Container(
        padding: EdgeInsets.all(10),
        child: FutureBuilder(
            future: datas,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data);
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.0,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0),
                    itemCount: 199,
                    itemBuilder: (BuildContext context, index) => SizedBox(
                        height: 50.0,
                        width: 50.0,
                        child: GestureDetector(
                            onTap: () => showcard(
                                snapshot.data[index]['cases'].toString(),
                                snapshot.data[index]['todayDeaths'].toString(),
                                snapshot.data[index]['recovered'].toString(),
                                snapshot.data[index]['deaths'].toString()),
                            child: Card(
                              child: Container(
                                  color: Color(0xFF292929),
                                  child: Center(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Image(
                                            image:
                                                AssetImage("images/wdeath.png"),
                                            height: 85,
                                            width: 85,
                                          ),
                                          Padding(padding: EdgeInsets.all(10)),
                                          Text(
                                            snapshot.data[index]['country'],
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                        ]),
                                  )),
                            ))));
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }

  Future showcard(String ind, inter, recover, death) async {
    await showDialog(
        context: context,
        builder: (BuildContext contect) {
          return AlertDialog(
            backgroundColor: Colors.white70,
            shape: RoundedRectangleBorder(),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GlowText(
                    "Total Cases :$ind",
                    style: GoogleFonts.alegreya(textStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,

                    )
                    
                    )),
                  GlowText(
                    "Today's Deaths :$inter",
                    style: GoogleFonts.alegreya(
                      textStyle: TextStyle(
                        color: Colors.redAccent[700],
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )
                    )
                    ,
                  ),
                  Text(
                    "Total Recoveries :$recover",
                    style:  GoogleFonts.alegreya(textStyle: TextStyle(
                      color: Colors.greenAccent[700],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,

                    )
                    
                    ),
                  ),
                  Text(
                    "Total Deaths :$death",
                    style:  GoogleFonts.alegreya(textStyle: TextStyle(
                      color: Colors.redAccent[700],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,

                    )
                    
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  final String url = "https://corona.lmao.ninja/v2/countries";
  late Future<List> datas;

  Future<List> getData() async {
    var response = await Dio().get(url);
    return response.data;
  }

  @override
  void initState() {
    super.initState();
    datas = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: GlowText(
              'Countrywise Statistics',
              glowColor: Colors.white,
              style: GoogleFonts.redressed(
                  textStyle: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.normal,
              )),
            ),
            backgroundColor: Colors.black),
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          child: Container(
            
              padding: EdgeInsets.all(10),
              child: FutureBuilder(
                  future: datas,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      print(snapshot.data);
                      return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1.0,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0),
                          itemCount: 199,
                          itemBuilder: (BuildContext context, index) =>
                              SizedBox(
                                  height: 50.0,
                                  width: 50.0,
                                  child: GestureDetector(
                                      onTap: () => showcard(
                                          snapshot.data[index]['cases']
                                              .toString(),
                                          snapshot.data[index]['todayDeaths']
                                              .toString(),
                                          snapshot.data[index]['recovered']
                                              .toString(),
                                          snapshot.data[index]['deaths']
                                              .toString()),
                                      child: Card(
                                        child: Container(
                                          
                                            decoration: BoxDecoration(
                                              color: Color(0x010E3311),
                                              
                                              
                                              boxShadow: [
                                                
                                                BoxShadow(
                                                    color: Colors
                                                        .blueGrey
                                                        .withOpacity(0.5),
                                                    blurRadius: 30,
                                                    offset: Offset(5, 5))
                                              ],
                                            ),
                                            child: Center(
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    // Padding(padding: EdgeInsets.only(top :10)),

                                                    GlowText(
                                                        'Total Cases:\n${snapshot.data[index]['cases'].toString()}',
                                                        glowColor:
                                                            Colors.red.shade900,
                                                        style: GoogleFonts
                                                            .alegreya(
                                                                textStyle:
                                                                    TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ))),

                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 5)),

                                                    Image(
                                                      image: NetworkImage(
                                                          '${snapshot.data[index]['countryInfo']['flag']}'),
                                                      height: 65,
                                                      width: 65,
                                                    ),

                                                    // Padding(padding: EdgeInsets.only(top :5)),

                                                    GlowText(
                                                      snapshot.data[index]
                                                          ['country'],
                                                      glowColor: Colors.black,
                                                      style: GoogleFonts
                                                          .alegreya(
                                                        textStyle: TextStyle(
                                                            color:
                                                                Colors.black,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    )
                                                  ]),
                                            )),
                                      ))));
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  })),
          onRefresh: () => onRefresh(),
        ));
  }
}
