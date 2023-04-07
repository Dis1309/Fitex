
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'choose.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:url_launcher/url_launcher.dart';
import "package:simple_icons/simple_icons.dart";
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/fitness1.jpg'), fit: BoxFit.fill)),
          child:Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("FITEX",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily:  'fonts/PT_Serif/PTSerif-Bold.ttf',
                                  fontSize: size.height/15,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 10,
                                ),),
                Center(
                  child: Bounce(
                              duration: Duration(milliseconds: 110),
                              onPressed: () {
                                Navigator.pushNamed(context, '/second');
                              },
                              child: CircleAvatar(
                                radius: (size.width+size.height)/12,
                                backgroundImage: AssetImage('assets/blue.jpg'),
                                child: Padding(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: const Text(
                                "Choose \nyour activity",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: Checkbox.width*(1.2),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                                ),
                              ),
                            ),
                ),
                          Container(
                                  width: 1000,
                                  height: 100,
                                  child: Text('The real choice of fit people',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold, 
                                    fontSize: size.height/40,
                                  ),
                                  ),
                                ),
              ],
            ),
          ),
      ),),
      bottomNavigationBar: below(),
      );
  }

 launcher(String h) async {
  var url = h;
  final uri = Uri.parse(url);
  if(await canLaunchUrl(uri)){
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
 }
 Widget below(){
  var size =MediaQuery.of(context).size;
return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("❤️ Disha Dwivedi",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size.height/50,
          ),),
          Container(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {launcher('https://www.linkedin.com/in/disha-dwivedi-b69025257');},
                  icon: const Icon(SimpleIcons.linkedin),
                ),
                IconButton(
                  onPressed: () {launcher('https://github.com/Dis1309');},
                  icon: const Icon(SimpleIcons.github),
                ),
              ],
            ),
          ),
        ],);
 }
}
