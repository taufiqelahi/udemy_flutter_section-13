import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_flutter_section13/provider/add_place_provider.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final formkey=GlobalKey<FormState>();
  final textController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add your place'),
      ),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            TextFormField(
              style: TextStyle(color: Colors.white,fontSize: 20),
              controller: textController,
              decoration: InputDecoration(
                counterStyle: TextStyle(color: Colors.white),
                labelText: 'Enter place'
              ),
              
            ),
            SizedBox(height: 20,),
            ElevatedButton.icon(onPressed: (){
              ref.read(placeHandlerProvider.notifier).addPlace(place: textController.text);
              Navigator.pop(context);

            }, icon: Icon(Icons.add), label: Text('add'),
            )
          ],
        ),
      ),
    );
  }
}
