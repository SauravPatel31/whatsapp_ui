import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/ui_styling.dart';

class CallsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CallPageState();
  }

}

class CallPageState extends State<StatefulWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: backGroundColor(),
        appBar: AppBar(
           // backgroundColor: backGroundColor(),
            //foregroundColor: Colors.white,
            title: Text("Calls",),
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.qr_code_scanner)),
              IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt_outlined,)),
              IconButton(onPressed: (){}, icon: Icon(Icons.search,)),
              PopupMenuButton(itemBuilder: (context) {
                return [
                  PopupMenuItem(child: Text("Clear call log")),
                  PopupMenuItem(child: Text("Settings")),
                ];
              },
                color: Color(0xff121B22),
                position: PopupMenuPosition.under,
              )
            ]
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Favourites",style: mytext17(),),
              SizedBox(height: 15,),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xff25D165),
                  child: Icon(Icons.favorite,color: Colors.black,),
                ),
                title: Text("Add to Favourites",style: mytext17(),),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:  Color(0xff25D165),
        foregroundColor: Colors.black,
        onPressed: (){},
        child: Icon(Icons.add_ic_call_rounded),
      ),
    );
  }

}