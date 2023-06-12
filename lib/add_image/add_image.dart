import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class AddImage extends StatefulWidget {
  const AddImage(this.addImageFunc ,{Key? key}) : super(key: key);

  final Function(File imagePath) addImageFunc;

  @override
  State<AddImage> createState() => _AddImageState();
}
class _AddImageState extends State<AddImage> {

  String? imagePath;

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final pickerFile = await imagePicker.pickImage(source: ImageSource.camera);

    if(pickerFile != null) {
      setState(() {
        imagePath = pickerFile.path;
      });
    }
    widget.addImageFunc(File(imagePath!));
  }

  @override
  Widget build(BuildContext context) {
    final imageProvider = imagePath  != null ? FileImage(File(imagePath!)) : null;

    return Container(
      width: 150,
      height: 300,
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: imageProvider,
          ),
          SizedBox(
            height: 10,
          ),
          OutlinedButton.icon(
            onPressed: (){
              pickImage();
            },
            label: Text('Choose Me'),
            icon: Icon(Icons.image),
          ),
          SizedBox(height: 80,),
          TextButton.icon(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
            label: Text('Close'),
          ),
        ],
      ),
    );
  }
}
