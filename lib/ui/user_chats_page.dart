import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_ui/ui/index_provider.dart';
import 'package:whatsapp_ui/utils/app_const_data.dart';

import '../utils/ui_styling.dart';

class UserChatsPage extends StatelessWidget{
  int sindex;
  UserChatsPage({required this.sindex});
  MediaQueryData? mqData;
  @override
  Widget build(BuildContext context) {
    mqData =MediaQuery.of(context);
    return mqData!.orientation==Orientation.portrait?Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(AppConstData.chatsdata[sindex]["profile_image"]),
            ),
            SizedBox(width: 20,),
            Text(AppConstData.chatsdata[sindex]["name"],style: TextStyle(fontSize: 18),),
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.video_call_outlined,size: 32,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.call,size: 25,)),
          PopupMenuButton(itemBuilder: (context){
            return[
              PopupMenuItem(child: Text("View contact",style: TextStyle(color: Colors.white),)),
              PopupMenuItem(child: Text("Media,Links,and docs",style: TextStyle(color: Colors.white))),
              PopupMenuItem(child: Text("Search",style: TextStyle(color: Colors.white))),
              PopupMenuItem(child: Text("Mute notifications",style: TextStyle(color: Colors.white))),
              PopupMenuItem(child: Text("Disappering messages",style: TextStyle(color: Colors.white))),
              PopupMenuItem(child: Text("Wallpaper",style: TextStyle(color: Colors.white))),
              PopupMenuItem(child: Text("More",style: TextStyle(color: Colors.white))),

            ];
          },
            color:Color(0xff121B22),
            position: PopupMenuPosition.under,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
            ),
          ),
          ///Send Message Button and TextField..
          Row(
            children: [
              Expanded(
                  child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xff8D969D),
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    // prefix: Icon(Icons.emoji_emotions_outlined),
                    // suffix: Icon(Icons.link)
                  ),
              )),
              ///Message Send Button
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.green,
                child: Icon(Icons.send_rounded,size: 22,color: Colors.black,),
              )
            ],
          )
        ],
      ),
    ):context.watch<IndexProvider>().getIndex()>=0?Scaffold(
     // backgroundColor: backGroundColor(),
      appBar: AppBar(
        //backgroundColor: backGroundColor(),
        //foregroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(AppConstData.chatsdata[sindex]["profile_image"]),
            ),
            SizedBox(width: 20,),
            Text(AppConstData.chatsdata[sindex]["name"],style: TextStyle(fontSize: 18),),
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.video_call_outlined,size: 32,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.call,size: 25,)),
          PopupMenuButton(itemBuilder: (context){
            return[
              PopupMenuItem(child: Text("View contact",)),
              PopupMenuItem(child: Text("Media,Links,and docs")),
              PopupMenuItem(child: Text("Search")),
              PopupMenuItem(child: Text("Mute notifications",)),
              PopupMenuItem(child: Text("Disappering messages",)),
              PopupMenuItem(child: Text("Wallpaper",)),
              PopupMenuItem(child: Text("More",)),

            ];
          },
            position: PopupMenuPosition.under,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
            ),
          ),
          ///Send Message Button and TextFiled..
          Row(
            children: [
              Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xff8D969D),
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      // prefix: Icon(Icons.emoji_emotions_outlined),
                      // suffix: Icon(Icons.link)
                    ),
                  )),
              ///Message Send Button
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.green,
                child: Icon(Icons.send_rounded,size: 22,color: Colors.black,),
              )
            ],
          )
        ],
      ),
    ):Center(child: Image.asset('assets/images/whatsapp.png'));


  }
}

