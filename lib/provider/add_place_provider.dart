
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_flutter_section13/model/place.dart';

class PlaceNotifier extends StateNotifier<List<Place>>{
  PlaceNotifier():super([]);
  addPlace({required String place}){
    final newPlace=Place(title: place);
    state=[...state,newPlace];
  }
}

final placeHandlerProvider=StateNotifierProvider<PlaceNotifier,List<Place>>((ref) => PlaceNotifier());