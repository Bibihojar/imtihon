// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart'as http;

// void main(){
//   runApp(MaterialApp(
//     home: API(),
//   ));
// }
// class API extends StatefulWidget {
//   const API({super.key});
//   @override
//   State<API> createState() => _APIState();
// }
// class _APIState extends State<API> {
//   List<Map<String,dynamic>> data = [];
//   dynamic nom = "";
//   Future<void> funksiya()async{
//     final response = await http.get(Uri.parse(
//       "http://universities.hipolabs.com/search?country=Malaysia"
//     ));
//     if (response.statusCode ==200){
//       final List<dynamic>jsonData = json.decode(response.body);
//       for (var narsa in jsonData){
//         data.add(Map<String,dynamic>.from(narsa));
//       }
//       setState(() {
//       });
//     }else {
//       throw Exception("Failed");
//     }
//   }
//   void initState(){
//     super.initState();
//     funksiya();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      body: ListView.builder(
//       itemCount: data.length,
//       itemBuilder: (context,index){
//         return
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             color: Colors.red,
//             child: Column(
//               children: [
//                 Text("Universitet nomi:${data[index]["name"]}"),
//                 Text("Web sayti:${data[index]["web_pages"]}"),
//                 Text("Domen:${data[index]["domains"]}"),
//               ],
//             ),
//             ),
//         );
//       },
//       ),
//     );
//   }
// }


 import 'dart:convert';

import 'package:flutter/material.dart';
 import 'package:http/http.dart';
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
  String bomdod = "";
  String peshin = "";
  String asr = "";
  String shom = "";
  String kun = "";
  String shahar = "";
  String oy = "";
  String city = "";
  String bugun = "";
  List namozvaqt = [];
  TextEditingController citycontroller = TextEditingController();
  void getData(city)async{
    String apiUrl = "https://api.aladhan.com/v1/timingsByAddress/present?address=$city";
    Response qabul = await get (Uri.parse(apiUrl));
    Map timeData = jsonDecode(qabul.body);
    Map vaqtlar =timeData["data"]["timings"];
    Map sana = timeData["data"]["date"];
    setState(() {
      bomdod = vaqtlar["Fajr"];
      peshin = vaqtlar["Dhuhr"];
      asr = vaqtlar["Asr"];
      shom= vaqtlar["Maghrib"];
      kun = sana["readable"];
      bugun = sana["gregorian"]["weekday"]["en"];
      shahar = timeData["data"]["meta"]["timezone"];
     namozvaqt = [];
     namozvaqt.add("bomdod :$bomdod");
     namozvaqt.add("peshin :$peshin");
     namozvaqt.add("asr :$asr");
     namozvaqt.add("shom :$shom");
     namozvaqt.add("kun :$kun");
     namozvaqt.add("bugun :$bugun");
     namozvaqt.add("manzil :$shahar");
    });
  }
  void initState(){
    super.initState();
    getData("Tashkent");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: citycontroller,
          ),
          ElevatedButton(
            onPressed: (){
              setState(() {
                city = citycontroller.text;
                getData(city);
              });
            }, child: Text("Vaqtni ko'rsat")),
            Container(
              height: 500,
              child: ListView(
                children:namozvaqt.map((ism)=>Text(ism)).toList(),
              ),
            )
        ],
      ),
    );
  }
}

 