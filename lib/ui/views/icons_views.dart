import 'package:e301_login/ui/cards/white_card.dart';
import 'package:e301_login/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class IconsViews extends StatelessWidget {
  const IconsViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children:[
          Text('Icons View',style: CustomLabels.h1,),
          SizedBox(height: 10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: [
              WhiteCard(
                title: 'ac_unit_outlined',
                child: Center(child: Icon(Icons.ac_unit_outlined)),
                width: 170,
              ),
              WhiteCard(
                title: 'access_alarm_outlined',
                child: Center(child: Icon(Icons.access_alarm_outlined)),
                width: 170,
              ),
              WhiteCard(
                title: 'apartment_outlined',
                child: Center(child: Icon(Icons.apartment_outlined)),
                width: 170,
              ),
              WhiteCard(
                title: 'car_rental_outlined',
                child: Center(child: Icon(Icons.car_rental_outlined)),
                width: 170,
              ),
              WhiteCard(
                title: 'umbrella_outlined',
                child: Center(child: Icon(Icons.umbrella_outlined)),
                width: 170,
              ),
            ]
          ),
        ] 
      ),
    );
  }
}