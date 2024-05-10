import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:studentportfolio/main.dart';


List data = [];

class ApiEndpoint extends StatefulWidget {
  const ApiEndpoint({Key? key}) : super(key: key);

  @override
  _ApiEndpointState createState() => _ApiEndpointState();
}

class _ApiEndpointState extends State<ApiEndpoint> {
  Future<void> fetchData() async {
    final response =
        // await http.get(Uri.parse('https://retoolapi.dev/gVly7r/data'));  refernce
        await http.get(Uri.parse('https://retoolapi.dev/fg1LUJ/data'));

    setState(() {
      data = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData().then((_) {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LandingPage(data)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Loading...")),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}

//---------------------------------------------API-----------------------------------------------------

//-----------------------------------------LANDING PAGE-----------------------------------------------------


class LandingPage extends StatelessWidget {
  final List data;

  const LandingPage(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return LandingPageProfile(
            data[index]['name'],
            data[index]['rollno'],
            data[index]['mobile_no'],
            data[index]['mail'],
            data[index]['dob'],
            data[index]['gender'],
            data[index]['degree'],
            data[index]['blood_group'],
          );
        },
      ),
    );
  }
}
