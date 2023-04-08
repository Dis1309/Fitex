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

Future<Bpm> bpm(dynamic link) async {
   final response = await http.get(
    Uri.parse('https://heart-rate-07.herokuapp.com/api?query=$link'),
    headers: {
  "Access-Control-Allow-Origin": "*", // Required for CORS support to work
  "Access-Control-Allow-Credentials": 'true', // Required for cookies, authorization headers with HTTPS
  "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
  "Access-Control-Allow-Methods": "GET, HEAD"
},
    );
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
    var size = MediaQuery.of(context).size;
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
        dynamic u =upload(value,dst);
        //y(path);
        bpm(u);
      //   
      if(path!='0'){
          
          return showDialog<void>(context: context,builder:(BuildContext context){ return AlertDialog(content:Text('$u'));});
        };
        
        
        
        // setState(() {
        //  url = y(path) as String;
        //  path =path;
         
        // });
        
      },
    );
    // return Container();
  }
  upload(XFile f,String path)  async{
    dynamic uploadtask; Uint8List j = await o(f);String d;
     if(kIsWeb){
       uploadtask = await storage.ref(path).putData(j);
     }else {
       uploadtask= await storage.ref(path).putFile(io.File(f.path));
     }
      d = await storage.ref(path).getDownloadURL();
     
     return d;
  }
  Future<Uint8List> o(XFile f)async {
    return await f.readAsBytes();
  }
}