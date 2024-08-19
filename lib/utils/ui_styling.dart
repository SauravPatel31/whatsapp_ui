
import 'package:flutter/material.dart';

///App Colors
Color mainColor(){
  return Color(0xff21C063);
}
Color backGroundColor(){
  return Color(0xff0B141B);
}
Color whiteClr(){
  return Color(0xffffffff);
}
Color grayClr(){
  return Color(0xff8D969D);
}

TextStyle mytext23({FontWeight myfontWeight = FontWeight.bold,Color?mycolr}){
  return TextStyle(
    fontSize: 23,
    color: mycolr??Colors.white,
    fontWeight: myfontWeight,
    fontFamily: "mons"
  );
}
TextStyle mytext17({FontWeight myfontWeight = FontWeight.normal,Color?mycolr}){
  return TextStyle(
    fontSize: 17,
    color: mycolr??Colors.white,
    fontWeight: myfontWeight,
    // fontFamily: "mons"
  );
}
TextStyle mytext13({FontWeight myfontWeight = FontWeight.normal,Color?mycolr}){
  return TextStyle(
    fontSize: 13,
    color: mycolr??Colors.grey,
    fontWeight: myfontWeight,
    // fontFamily: "mons"
  );
}
TextStyle mytext11({FontWeight myfontWeight = FontWeight.bold,Color?mycolr}){
  return TextStyle(
    fontSize: 11,
    color: mycolr??Colors.green,
    fontWeight: myfontWeight,
    // fontFamily: "mons"
  );
}

///font styling..
