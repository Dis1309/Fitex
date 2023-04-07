import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/choose.dart';
import 'package:flutter/gestures.dart';
import 'screens/Heartrate.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras = [];


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  debugPrintGestureArenaDiagnostics = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/third',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context)=> const Home(),
        '/second': (context) => const Choose(),
        '/third':(context)=>  Heart(cameras: cameras,),
      },
    );
  }
}
