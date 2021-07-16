import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class MostCountry extends StatefulWidget {
  @override
  _MostCountryState createState() => _MostCountryState();
}

class _MostCountryState extends State<MostCountry> {
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
    

    fetchaffdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: affcountry.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${affcountry[index]['country']}'),
              );
            },
          ),
        ],
      ),
    );
  }
}
