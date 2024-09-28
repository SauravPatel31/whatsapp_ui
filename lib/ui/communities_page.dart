import 'package:flutter/material.dart';
import 'package:whatsapp_ui/utils/ui_styling.dart';

class CommunitiesPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CommunitiePageState();
  }

}

class CommunitiePageState extends State<StatefulWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: backGroundColor(),
      appBar: AppBar(
          // backgroundColor: backGroundColor(),
          //foregroundColor: Colors.white,
          title: Text("Communities",),
          actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.qr_code_scanner,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt_outlined,)),
          PopupMenuButton(itemBuilder: (_){
            return[
              PopupMenuItem(child: Text("Settings",))
            ];
          },
              color: Color(0xff121B22),
            position: PopupMenuPosition.under,
          )
          ]
      ),
      body: ListTile(
        leading: Stack(
          children: [
            Container(
              width:50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),

              ),
              child: Center(child: Icon(Icons.groups,color: Colors.white,)),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: 10,
                backgroundColor:  Color(0xff25D165),
                child: Icon(Icons.add,color: Colors.black,size: 15,),
              ),
            )
          ],
        ),
        title: Text("New community",style: mytext17(myfontWeight: FontWeight.normal),),
      ),
    );
  }

}