import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_flutter_section13/component/place_list.dart';
import 'package:udemy_flutter_section13/provider/add_place_provider.dart';
import 'package:udemy_flutter_section13/screen/add_place.dart';

class PlaceScreen extends ConsumerWidget {
  const PlaceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlace = ref.watch(placeHandlerProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Place'),
          centerTitle: false,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const AddPlaceScreen();
                  }));
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: PlaceList(
                  place: userPlace,
                ));
  }
}
