import 'package:flutter/material.dart';

class IndexProvider extends ChangeNotifier{
  int _selectedIndex=-1;
  void updateIndex(int index){
    _selectedIndex=index;
    notifyListeners();
  }
  getIndex()=>_selectedIndex;
}