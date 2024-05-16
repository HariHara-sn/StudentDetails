// ignore_for_file: library_private_types_in_public_api

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

class LandingPage extends StatefulWidget {
  final List data;

  const LandingPage(this.data, {Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late List filteredData;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredData = widget.data;
  }

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredData = widget.data;
      });
      return;
    }

    // setState(() {
    //   filteredData = widget.data.where((item) => item['name'].toString().toLowerCase().contains(query.toLowerCase())).toList();  //here how i resolved (i converted this to toString :)

    // });  for single search eg: only for serach name 👆

    setState(() {
      filteredData = data.where((item) {
        var nameofStudent = item['name'].toString().toLowerCase();
        var rollnumber = item['rollno'].toString().toLowerCase();
        // var _mobileNo = item['mobile_no'].toString().toLowerCase();
        return nameofStudent.contains(query.toLowerCase()) ||
            rollnumber.contains(query.toLowerCase());
        // || _mobileNo.contains(query.toLowerCase());  If you needed you can add them
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Landing Page'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: filterSearchResults,
              decoration: const InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(fontSize: 15),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredData.length,
        itemBuilder: (context, index) {
          return LandingPageProfile(
            filteredData[index]['name'],
            filteredData[index]['rollno'],
            filteredData[index]['mobile_no'],
            filteredData[index]['mail'],
            filteredData[index]['dob'],
            filteredData[index]['gender'],
            filteredData[index]['degree'],
            filteredData[index]['blood_group'],
          );
        },
      ),
    );
  }
}
