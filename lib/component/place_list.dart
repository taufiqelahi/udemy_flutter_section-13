import 'package:flutter/material.dart';
import 'package:udemy_flutter_section13/model/place.dart';
import 'package:udemy_flutter_section13/screen/place_details_screen.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({super.key, required this.place});
  final List<Place> place;

  @override
  Widget build(BuildContext context) {
    if(place.isEmpty){
      return Center(child: Text('No intems Addded',style: Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(color: Theme.of(context).colorScheme.onBackground),));
    }
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>PlaceDetailsScreen(place: place[index])));
          },
          title: Text(
            place[index].title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        );
      },
      itemCount: place.length,
    );
  }
}
