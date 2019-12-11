import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app/city_data/city_data.dart';

class SelectCity extends StatefulWidget {
  @override
  _SelectCityState createState() => _SelectCityState();
}
class _SelectCityState extends State<SelectCity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add City"),
      ),
      body: CityList(),
    );
  }
}
class SelectCityBody extends StatefulWidget {
  const SelectCityBody({
    Key key,
    @required this.cityList,
  }) : super(key: key);

  final List cityList;
  @override
  _SelectCityBodyState createState() => _SelectCityBodyState();
}

class _SelectCityBodyState extends State<SelectCityBody> {
  List searchResult = List();
  void onSearchOperation(String searchText) {
    //search for input text in city list
    searchResult.clear();
    for (int i = 0; i < widget.cityList.length; i++) {
      dynamic data = widget.cityList[i]['name'];
      if (data.toLowerCase().contains(searchText.toLowerCase())) {
        searchResult.add(data);
      }
      setState(() {
        
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        margin: const EdgeInsets.all(10),
        child: TextField(
          onChanged: onSearchOperation,
          decoration: InputDecoration(
            hintText: 'Search',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
          ),
        ),
      ),
      Flexible(
        child: searchResult.length != 0
            ? ListView.builder(
                itemCount: searchResult == null ? 0 : searchResult.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.00,
                    child: ListTile(
                      title: Text(searchResult[index]),
                    ),
                  );
                },
              )
            : ListView.builder(
                itemCount: widget.cityList == null ? 0 : widget.cityList.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.00,
                    child: ListTile(
                      title: Text(widget.cityList[index]['name']),
                    ),
                  );
                },
              ),
      ),
    ]);
  }
}
