import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';



class FirestoreService{
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<XFile?> getImage() async{

    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  Future<void> upload(String path) async{

    File file = File(path);
    try {
      String ref = 'animais/img-${DateTime.now().toString()}.jpg';
      await storage.ref(ref).putFile(file);
    } on FirebaseException catch(e){
      throw Exception('Erro no upload: ${e.code}');
    }

  }
  pickAndUploadImage() async{
    XFile? file = await getImage();
    if(file!= null){
      await upload(file.path);
    }
  }


}