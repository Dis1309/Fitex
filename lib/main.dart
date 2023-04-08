import 'package:fitex/screens/camera.dart';
import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/choose.dart';
import 'package:flutter/gestures.dart';
import 'screens/Heartrate.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/firebase_options.dart';

List<CameraDescription> cameras = [];


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  debugPrintGestureArenaDiagnostics = true;
  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,

);
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
        '/fourth':(context)=> Camera()
      },
    );
  }
}