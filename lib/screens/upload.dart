import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';

class u {
  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(file);
    } on FirebaseException catch (e) {
      return null;
    }
  }

  static UploadTask? uploadBytes(String destination, Future<dynamic> data) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putData(data as Uint8List);
    } on FirebaseException catch (e) {
      return null;
    }
  }
}
