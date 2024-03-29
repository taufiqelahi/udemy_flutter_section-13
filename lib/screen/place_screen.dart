import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_flutter_section13/provider/add_place_provider.dart';
import 'package:udemy_flutter_section13/screen/add_place.dart';

class PlaceScreen extends ConsumerWidget {
  const PlaceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activePlace = ref.watch(placeHandlerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Place'),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return AddPlaceScreen();
                }));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: activePlace
              .map((e) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(e,style: TextStyle(color: Colors.white,fontSize: 24),),
              ))
              .toList()),
    );
  }
}
