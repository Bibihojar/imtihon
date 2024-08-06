import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

void main(){
  runApp(MaterialApp(
    home: API(),
  ));
}
class API extends StatefulWidget {
  const API({super.key});

  @override
  State<API> createState() => _APIState();
}

class _APIState extends State<API> {
  List<Map<String,dynamic>> data = [];
  dynamic nom = "";
  Future<void> funksiya()async{
    final response = await http.get(Uri.parse(
      "http://universities.hipolabs.com/search?country=Malaysia"
    ));
    if (response.statusCode ==200){
      final List<dynamic>jsonData = json.decode(response.body);
      for (var narsa in jsonData){
        data.add(Map<String,dynamic>.from(narsa));
      }
      setState(() {
      });
    }else {
      throw Exception("Failed");
    }
  }
  void initState(){
    super.initState();
    funksiya();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
     body: ListView.builder(
      itemCount: data.length,
      itemBuilder: (context,index){
        return
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.red,
            child: Column(
              children: [
                Text("Universitet nomi:${data[index]["name"]}"),
                   Text("Web sayti:${data[index]["web_pages"]}"),
                      Text("Domen:${data[index]["domains"]}"),
              ],
            ),),
        );
      },
      ),
    );
  }
}