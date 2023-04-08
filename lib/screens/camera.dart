import 'dart:convert';
import 'dart:io' as io;
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter_camera/flutter_camera.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'bpm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitex/screens/firebase_options.dart';
//import 'package:xfile/xfile.dart';
import 'package:image_picker/image_picker.dart';
import 'upload.dart' as d;

Future<Bpm> bpm(String link) async {
   final response = await http.get(
    Uri.parse('https://heart-rate-07.herokuapp.com/api?query=$link'),);
    if(response.statusCode == 200){
      return Bpm.fromJson(jsonDecode(response.body));
    }else {
      throw Exception('Failed to measure');
    }
}

var storage =FirebaseStorage.instance;
 String url ='0';
// u(File f,String h){

// UploadTask? uploadfile(){
//   try{
//     final ref = storage.ref(h);
//     return ref.putFile(f);
//   } 
//   on FirebaseException {
//     return null;
//   }

// }}


// UploadTask? uploadBytes(Uint8List f,String h){
//   try{
//     final ref = storage.ref(h);
//     return ref.putData(f);
//   } 
//   on FirebaseException {
//     return null;
//   }
// }
y(var k) async{
    // final snapshot = storage.ref(k).;
    try {final up = await storage.ref(k).getDownloadURL();
    String i = up;
    return i;}
    on FirebaseException catch(e){
      print("${e.code}");
    }
}
//  Uint8List hello(XFile y) {
//   Uint8List b =  y.readAsBytes();
//   return b;
// }
late Uri dorl;
// ignore: prefer_typing_uninitialized_variables
String path = 'zero';

class Camera extends StatefulWidget{
  const Camera ({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  @override 
  bool t= true;
  Widget build(BuildContext context){
    return FlutterCamera(
      color: Colors.amber,
      onImageCaptured: (value) {
         path = value.path;
        //print("::::::::::::::::::::::::::::::::: $path");
          },
      onVideoRecorded: (value) {
       path = value.path;
        //final file = 
        //print('::::::::::::::::::::::::;; dkdkkd $path');
        ///Show video preview .mp4
        
        String x = "test.mp4";
        String dst = '$path/$x';
        upload(value,dst);
        String u =y(path);
        //bpm(u);
        if(path!='0'){
          return showDialog(context: context, builder: (context)=>AlertDialog(content: Text('$u'),));
        }
        
        
        // setState(() {
        //  url = y(path) as String;
        //  path =path;
         
        // });
        
      },
    );
    // return Container();
  }
  upload(dynamic f,String path) async {
    final UploadTask uploadtask;
     if(kIsWeb){
       uploadtask = storage.ref(path).putData(await f.readAsBytes());
     }else {
       uploadtask = storage.ref(path).putFile(io.File(f.path));
     }
     return uploadtask;
  }
}