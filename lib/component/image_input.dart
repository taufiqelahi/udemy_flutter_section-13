import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
   const ImageInput({super.key, required this.image});
 final void Function(File) image;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File ?selectedImage;
  @override
  Widget build(BuildContext context) {
    Widget content=selectedImage==null?TextButton.icon(
        onPressed: takeImage,
        icon: const Icon(Icons.camera),
        label: const Text('Take Picture')):Image.file(selectedImage!,fit: BoxFit.cover,);
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2))),
      child:content,
    );
  }

  Future<void> takeImage() async {
    final imagePicker=ImagePicker();
  final pickedImage= await imagePicker.pickImage(source: ImageSource.gallery);
if(pickedImage==null){
  return;
}
  setState(() {
    selectedImage=File(pickedImage.path);
  });
widget.image(selectedImage!);
  }

}
