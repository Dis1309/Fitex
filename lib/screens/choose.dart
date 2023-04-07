import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:indexed/indexed.dart';
//import 'package:provider/provider.dart';
import 'home.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:url_launcher/url_launcher.dart';
import "package:simple_icons/simple_icons.dart";
class Choose extends StatefulWidget {
  const Choose({super.key});

  @override
  State<Choose> createState() => _ChooseState();
}

class _ChooseState extends State<Choose> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;
  
  @override
  void initState(){
    super.initState();
    animationController = AnimationController(vsync: this,
    duration: Duration(seconds: 10));
    anime(1.5,1.5);
    delayedStart();
  }
   Animation<Offset> anime(double x,double y){
  animation = Tween<Offset>(begin: Offset(x, y),end: Offset(0.0,0.0)).animate(animationController)
    ..addListener((){setState(() {
      
    });});
    return animation;
  }
  void delayedStart() async {
    await Future.delayed(const Duration(milliseconds: 10),(){
      animationController.forward();
    });
  }
  @override
  void dispose(){
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/fitness1.jpg'), fit: BoxFit.fill)),
          child: Indexer(
            children: 
              [Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Indexed(
                      index:1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Bounce(
                        duration: Duration(milliseconds: 110),
                        onPressed: () {
                          const Text("hel");
                        },
                        child:SlideTransition(
      position: anime(1.5,1.5),
      child:_animatedButton(
                                  "Heart Rate", const Icon(Icons.monitor_heart),))),
                           
                           Bounce(
                        duration: Duration(milliseconds: 110),
                        onPressed: () {
                          const Text("hel");
                        },
                        child:SlideTransition(
      position: anime(1.5,-1.5),
      child:_animatedButton(
                                "Running Time", const Icon(Icons.directions_run),))),
                           
                        ],
                      ),
                    ),
                    Indexed(
                      index: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Padding(
                             padding: const EdgeInsets.only(top:80.0),
                             child: Bounce(
                        duration: Duration(milliseconds: 110),
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                        },
                        child:SlideTransition(
      position: anime(0,2.5),
      child:_animatedButton(
                                  "Home", const Icon(Icons.home),))),
                           ),
                          
                          
                           Padding(
                            padding: const EdgeInsets.only(bottom:80.0),
                            child: Bounce(
                        duration: Duration(milliseconds: 110),
                        onPressed: () {
                          const Text("hel");
                        },
                        child:SlideTransition(
                            position: anime(0,-2.5),
                            child:_animatedButton("Feedback", const Icon(Icons.feedback),)))
                           ),
                        ],
                      ),
                    ),
                    Indexed(
                      index: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                           Bounce(
                        duration: Duration(milliseconds: 110),
                        onPressed: () {
                          const Text("hel");
                        },
                        child:SlideTransition(
      position: anime(-1.5,1.5),
      child:_animatedButton(
                                "Records", const Icon(Icons.receipt_long),))),
                           Bounce(
                        duration: Duration(milliseconds: 110),
                        onPressed: () {
                          const Text("hel");
                        },
                        child:SlideTransition(
      position: anime(-1.5,-1.5),
      child:_animatedButton(
                                "Health Check", const Icon(Icons.health_and_safety),))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Bounce(
                              duration: Duration(milliseconds: 110),
                              onPressed: () {
                                Navigator.pushNamed(context, '/');
                              },
                              child: CircleAvatar(
                                radius: (size.width+size.height)/12,
                                backgroundImage: AssetImage('assets/blue.jpg'),
                                child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
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
            ],
          )),
    ),
    bottomNavigationBar: below(),);
  }

  Widget _animatedButton(String h, Icon o) {
    var size = MediaQuery.of(context).size;
    return  Container(
        height: size.height / 8,
        width: size.width / 4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            boxShadow: [
              BoxShadow(
                color: Color(0x80000000),
                blurRadius: 12.0,
                offset: Offset(0.0, 5.0),
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff33ccff),
                Color(0xffff99cc),
              ],
            )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  h,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: size.width / 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              //SizedBox(width: 20,height:30),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: o,
              )
            ],
          ),
        ),
      );
    
    
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
        ],);}
        launcher(String h) async {
  var url = h;
  final uri = Uri.parse(url);
  if(await canLaunchUrl(uri)){
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
 }
}