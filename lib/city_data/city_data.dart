import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/select_city.dart';

class CityList extends StatefulWidget {
  @override
  _CityListState createState() => _CityListState();
}
class _CityListState extends State<CityList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('city_id.json'),
      builder: (context, snapshot) {
     List cityList = json.decode(snapshot.data.toString());
     return new SelectCityBody(cityList: cityList);
      },
    );
  }
}
