import 'package:flutter/material.dart';
import 'package:amplify/config/consts.dart';

class DropdownList extends StatefulWidget {
  @override
  _DropdownListState createState() => _DropdownListState();
}
class _DropdownListState extends State<DropdownList> {
  String _selectedText;
  @override
  void initState() {
    super.initState();
    _selectedText = trainingFrequencyList[0];
  }
  @override
  Widget build (BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container (
      width: _width * 0.8,
      height: 45,
      padding: EdgeInsets.only(left:10,),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton (
          isDense: true,
          style: TextStyle (color: Colors.black),
          value: _selectedText,
          onChanged: (text) {
            print ('---- new: $text ------');
            setState( () {
              _selectedText = text;
            });
          },
          items: trainingFrequencyList.map ((value) {
            return DropdownMenuItem(
              child: Text(value, style: TextStyle(color: Colors.black),),
              value: value,
            );
          }).toList(),
        ),
      ),
    );
  }
}