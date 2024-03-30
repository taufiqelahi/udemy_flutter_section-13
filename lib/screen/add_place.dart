import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_flutter_section13/component/image_input.dart';
import 'package:udemy_flutter_section13/component/location_input.dart';
import 'package:udemy_flutter_section13/provider/add_place_provider.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  File? selectedImage;
  final formkey = GlobalKey<FormState>();
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add your place'),
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground),
                  controller: textController,
                  decoration: const InputDecoration(
                      counterStyle: TextStyle(color: Colors.white),
                      labelText: 'Enter place'),
                ),
                const SizedBox(height: 20,),
               ImageInput(image:(image){
                 selectedImage=image;
               },),
                const SizedBox(
                  height: 20,
                ),
                LocationInput(),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    if(textController.text.trim().isEmpty || selectedImage==null){
                      return;
                    }
                    ref
                        .read(placeHandlerProvider.notifier)
                        .addPlace(place: textController.text, image: selectedImage!);
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('add'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
