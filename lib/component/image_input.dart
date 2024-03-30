import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2)
        )
      ),
      child: TextButton.icon(onPressed: (){}, icon: Icon(Icons.camera), label: Text('Take Picture')),
    );
  }
}