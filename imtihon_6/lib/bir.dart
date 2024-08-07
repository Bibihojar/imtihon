
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: API(),
  ));
}

class API extends StatefulWidget {
  const API({super.key});
  
  @override
  State<API> createState() => _APIState();
}

class _APIState extends State<API> {
  List<Map<String, dynamic>> data = [];
  int selectedIndex = 0; // Track the selected index

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
      "https://cbu.uz/uz/arkhiv-kursov-valyut/json/"
    ));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      for (var item in jsonData) {
        data.add(Map<String, dynamic>.from(item));
      }
      setState(() {});
    } else {
      throw Exception("Failed to load data");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Color _getDiffColor(String diff) {
    final value = double.tryParse(diff) ?? 0;
    return value < 0 ? Colors.red : Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(""),
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text("Valyuta kurslari", style: TextStyle(
            color: Colors.white,
            fontSize: 28,
          )),
        ),
        backgroundColor: const Color.fromARGB(255, 33, 44, 243),
        toolbarHeight: 100,
        actions: [
          // Display the currently selected currency code
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                DateFormat.yMd().format(DateTime.now()),
                style: TextStyle(color: Colors.white,fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index; // Update selected index on tap
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                 color: Colors.white,
                 border: Border(bottom: BorderSide(color: Colors.black,width: 2))
                ),
                
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("updated day"),
                                Text("${data[index]["Date"]}"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${data[index]["Nominal"]}"),
                            ),
                             Text("${data[index]["Ccy"]}"),
                          ],
                        ),
                         Column(
                           children: [
                             Row(
                               children: [
                                 Text(" ${data[index]["CcyNm_UZ"]}",style: TextStyle(color: const Color.fromARGB(255, 33, 44, 243),),),
                                 Text(" ${data[index]["Code"]}",style: TextStyle(color:const Color.fromARGB(255, 33, 44, 243),),),
                               ],
                             ),
                              Text(" ${data[index]["Rate"]}",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),)
                           ],
                         ),
                          Text(" ${data[index]["Diff"]}", style: TextStyle(color: _getDiffColor(data[index]["Diff"] ?? '0'))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
