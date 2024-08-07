
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:imtihon_6/bir.dart';
import 'package:lottie/lottie.dart';
 // Import the new file

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyWidget(),
  ));
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});
  
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String nom = "34";
  int a = 0;
  bool isValid = true; // New state to check validation

  void ism() {
    setState(() {
      if (name.text.isEmpty) {
        isValid = false; // Mark as invalid if text is empty
      } else {
        nom = name.text; // Update nom with the text from the TextField
        isValid = true; // Mark as valid
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Information saved"),
            backgroundColor: const Color.fromARGB(255, 33, 44, 243),
          ),
        );
      }
    });
  }

  TextEditingController name = TextEditingController();
  List<String> images = [
    "rasm/q1.png",
    "rasm/q2.png",
    "rasm/q3.png",
    "rasm/q4.png",
    "rasm/q5.png",
    "rasm/q6.png",
    "rasm/q7.png",
    "rasm/q8.png",
    "rasm/q9.png",
    "rasm/q10.png",
    "rasm/q11.png",
    "rasm/q12.png",
    "rasm/q13.png",
    "rasm/q14.png",
    "rasm/q15.png",
    "rasm/q16.png",
    "rasm/q17.png",
    "rasm/q18.png",
    "rasm/q19.png",
    "rasm/q20.png",
    "rasm/q21.png",
    "rasm/q22.png",
    "rasm/q23.png",
    "rasm/q24.png",
    "rasm/q25.png",
    "rasm/q26.png",
    "rasm/q27.png",
    "rasm/q28.png",
    "rasm/q29.png",
    "rasm/q30.png",
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  actions: [
                    TextButton(
                      onPressed: () {
                        ism();
                        if (isValid) {
                          Navigator.pop(context); // Close the dialog only if valid
                        }
                      },
                      child: Text("OK"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Back"),
                    ),
                  ],
                  backgroundColor: Colors.white,
                  content: Container(
                    height: 100,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextField(keyboardType: TextInputType.number,
                            controller: name,
                            maxLength: 2,
                            decoration: InputDecoration(
                              labelText: "Enter your age",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: isValid ? Colors.blue : Colors.red, // Red border if invalid
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            child: Lottie.asset('lotte/button.json'),
          ),
        ],
        leading: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => API()));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("rasm/money.png"))
              ),
            )
          ),
        ),
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: <Color>[const Color.fromARGB(255, 33, 44, 243), Colors.green],
            tileMode: TileMode.clamp,
          ).createShader(bounds),
          child: Text(
            "flutter",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Set to transparent to show gradient
            ),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("HIS AGE", style: TextStyle(color: const Color.fromARGB(255, 89, 88, 88), fontSize: 10)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text("$nom", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 50)),
                              Text("/100", style: TextStyle(color: Colors.grey, fontSize: 15)),
                            ],
                          ),
                        ),
                        Text("OVERALL", style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w600)),
                        // Example for multiple rows
                        Row(
                          children: [
                            Container(
                              height: 30,
                              child: Icon(Icons.heart_broken,size: 30,color: Colors.red,)
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("34", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                      ),
                                      Text("/100", style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                  Text("Energy", style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w700)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        _buildStatRow("rasm/glass.png", "24", "/100", "Smart"),
                        _buildStatRow("rasm/lightning.png", "54", "/100", "Speed"),
                      ],
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Positioned(
                              left: 180,
                              top: 300,
                              child: Transform(
                                transform: Matrix4.skew(5, 60),
                                child: Container(
                                  height: 70,
                                  child: Lottie.asset('lotte/circul1.json'),
                                ),
                              ),
                            ),
                             Padding(
                              padding: const EdgeInsets.only(top: 100),
                              child: Positioned(
                                top: 100,
                                left: 20,
                                child: Container(
                                  height: 300,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage("rasm/o'zim2.png")),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text("Old memory", style: TextStyle(color: Colors.black, fontSize: 15)),
                  ],
                ),
                Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width * 0.9, // 90% of the screen width
                  child: CarouselSlider(
                    items: images.map((imagePath) {
                      return GestureDetector(
                                                 onTap: () {
                             Navigator.push(
                               context,
                               MaterialPageRoute(
                                 builder: (context) => ImagePage(imagePath: imagePath),
                               ),
                             );
                           },
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: ClipRRect(
                               borderRadius: BorderRadius.circular(30.0),
                               child: Image.asset(
                                 imagePath,
                                 fit: BoxFit.cover,
                               ),
                             ),
                           ),
                         );
                       }).toList(),
                       options: CarouselOptions(
                         height: 300,
                         aspectRatio: 16 / 9,
                         viewportFraction: 0.8,
                         initialPage: 0,
                         enableInfiniteScroll: true,
                         reverse: false,
                         autoPlay: true,
                         autoPlayInterval: Duration(seconds: 3),
                         autoPlayAnimationDuration: Duration(milliseconds: 500),
                         autoPlayCurve: Curves.fastOutSlowIn,
                         enlargeCenterPage: true,
                         enlargeFactor: 0.3,
                         scrollDirection: Axis.horizontal,
                       ),
                     ),
                   ),
                 ],
               ),
             ),
           ),
         ),
       );
     }

     Widget _buildStatRow(String imagePath, String value, String total, String salom) {
       return Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Row(
             children: [
               Container(
                 height: 30,
                 width: 30,
                 decoration: BoxDecoration(
                   image: DecorationImage(image: AssetImage(imagePath)),
                 ),
               ),
               SizedBox(width: 10),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(value, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
               ),
               Text(total, style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w500)),
             ],
           ),
           Padding(
             padding: const EdgeInsets.only(left: 20),
             child: Text(salom, style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w700)),
           ),
         ],
       );
     }
   }
// image_page.dart


class ImagePage extends StatelessWidget {
  final String imagePath;

  const ImagePage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Image Viewer', style: TextStyle(color: Colors.black)),
      ),
      body: Center(
        child: Image.asset(imagePath),
      ),
    );
  }
}
