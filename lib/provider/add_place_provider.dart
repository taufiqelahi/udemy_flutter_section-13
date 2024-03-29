
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceNotifier extends StateNotifier<List<String>>{
  PlaceNotifier():super([]);
  addPlace({required String place}){
    state=[...state,place];
  }
}

final placeHandlerProvider=StateNotifierProvider<PlaceNotifier,List<String>>((ref) => PlaceNotifier());