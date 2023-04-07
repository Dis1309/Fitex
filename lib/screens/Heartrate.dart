import 'dart:async';
//import 'package:FITNESS/main.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';
import 'chart.dart';
import 'package:heart_bpm/heart_bpm.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:screen_recorder/screen_recorder.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
//import 'package:flutter_video/camera_page.dart';

class Heart extends StatefulWidget {
  Heart({super.key,required this.cameras});
  List<CameraDescription> cameras;
  @override
  Heartstate createState() {
    return Heartstate();
  }
}

class Heartstate extends State<Heart> with SingleTickerProviderStateMixin {
  bool hello = true; bool t = false;bool exporting = false;bool nw = false;
  late CameraController control;
  late Future<void> _initializeControllerFuture;
  late Timer _timer; var gif;
  int start =15;
  ScreenRecorderController scontrol = ScreenRecorderController(pixelRatio: 0.5,
    skipFramesBetweenCaptures: 2,);
  bool get canexport => scontrol.exporter.hasFrames;
  void startTimer(){
    const sec = Duration(seconds: 1);
    _timer =  Timer.periodic(sec, (Timer timer) {
      if(start == 0){setState((){timer.cancel();scontrol.stop();
      g();
      });}
      else {if(t==false){timer.cancel();start++;}
        {setState((){start--;});};
      }
     });
     
  }
  g() async{
   gif = await scontrol.exporter.exportGif();
  }
  @override
  void initState(){
    super.initState();
    control = CameraController(widget.cameras[0], ResolutionPreset.max);
    _initializeControllerFuture = control.initialize();
  }

  @override
  void dispose(){
    super.dispose();
    control.dispose();
    _timer.cancel();
  }
  @override 
  Widget build(BuildContext context){
    var size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: SafeArea(child: Container(
        width: size.width,
        height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/heart.jpg'),fit: BoxFit.fill)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children:[ 
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Text('Heart Rate Check',style: TextStyle(
                color: Colors.white,
                fontSize: (size.width+size.height)/40,fontWeight: FontWeight.bold,
                letterSpacing: 15,
              ),
              textAlign: TextAlign.center,
            ),
            ),
            hello?cam(size):Bounce(onPressed: ()=>{setState((){hello = !hello;})},
            duration: Duration(milliseconds: 110),
            child: Center(child: Stack(
              clipBehavior: Clip.none,
              children: [
                
                Icon(Icons.favorite,size: (size.width+size.height)/3,color:Color.fromRGBO(32, 49, 58, 50),
                shadows:const  [
                  Shadow(color: Colors.blue,offset: Offset.infinite),
                   Shadow(color: Colors.white,offset: Offset.infinite),
                ],
                ),
                Positioned(
                  top: (size.width+size.height)/10,left: (size.width+size.height)/13,
                  child: Text('Click to check Heart rate\n\n\n#IMPORTANT\n-Place finger on camera and flash\n-Timer stops in 15s',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: (size.width+size.height)/80,
                  ),
                  textAlign: TextAlign.center,)),]
            )
            ),),
            Text('*The prediction may not be 100% accurate. Therefore,in case of too high and too low value do check on real machine again.',
            textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: (size.width+size.height)/100,
                  ),)
            ]
          )
      ))
    );
  }
  Widget cam(var size){
    return Container(
      width: (size.width+size.height)/4,height:(size.width+size.height)/4,
      child: FutureBuilder(future: _initializeControllerFuture,builder: ((context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done){return record(size);}
        else {return const Center(child:CircularProgressIndicator());}
      })),
    );
  }

  Widget record(var size){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom:8.0),
          child: Text('$start',style: TextStyle(color: Colors.white,
          fontSize: (size.width+size.height)/50),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            
            AnimatedButton(
                  animatedOn: AnimatedOn.onHover,
                  onPress: () {
                    setState(() {
                    t=!t;
                  });
                  t?{startTimer(),scontrol.start()}:{setState((){start=15;})};},
                  onChanges: (change) {},
                  height: (size.width+size.height)/45,
                  width: (size.width+size.height)/10,
                  text: t?'Stop':'Record',
                  isReverse: true,
                  selectedTextColor: Colors.black,
                  transitionType: TransitionType.LEFT_TOP_ROUNDER,
                  backgroundColor: Colors.black,
                  selectedBackgroundColor: Color.fromARGB(255, 53, 216, 216),
                  borderColor: Colors.white,
                  borderWidth: 1,
                ),
                AnimatedButton(
                  animatedOn: AnimatedOn.onHover,
                  onPress: () {},
                  onChanges: (change) {},
                  height: (size.width+size.height)/45,
                  width: (size.width+size.height)/10,
                  text: 'Cancel',
                  isReverse: true,
                  selectedTextColor: Colors.black,
                  transitionType: TransitionType.LEFT_TOP_ROUNDER,
                  backgroundColor: Colors.black,
                  selectedBackgroundColor: Color.fromARGB(255, 53, 216, 216),
                  borderColor: Colors.white,
                  borderWidth: 1,
                ),
          ],
        ),
        ),
      t?actualrecorder(size):CameraPreview(control),
      Text('BPM VALUE',
            textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: (size.width+size.height)/100,
                  ),),
      nw?hv():Text('0',
            textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: (size.width+size.height)/100,
                  ),),
      ],
    );
    
  }
  Widget actualrecorder(var size){
      return ScreenRecorder(
  width: (size.width+size.height)/5, height: (size.width+size.height)/8,
  background: Colors.white,
  controller: scontrol,
        child:CameraPreview(control), 
  
   // child which should be recorded
);
 }
 Widget hv(){
  return Container();
 }
    // stre() async {
      
    //   if(rec){
    //     final file = await control.stopVideoRecording();
    //     setState(() {
    //       start =15;
    //     },);
    //     AnimatedButton(
    //               animatedOn: AnimatedOn.onHover,
    //               onPress:  () async {
                      
    //                 },
    //               onChanges: (change) {},
    //               height: 50,
    //               width: 50,
    //               text: 'Export',
    //               isReverse: true,
    //               selectedTextColor: Colors.black,
    //               transitionType: TransitionType.LEFT_TOP_ROUNDER,
    //               backgroundColor: Colors.black,
    //               selectedBackgroundColor: Color.fromARGB(255, 53, 216, 216),
    //               borderColor: Colors.white,
    //               borderWidth: 1,
    //             );
    //     t = false;
    //   }else {
    //    await control.prepareForVideoRecording();
    //    await control.startVideoRecording();
    //   }
    // }
}
