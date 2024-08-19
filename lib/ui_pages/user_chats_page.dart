import 'package:flutter/material.dart';
import 'package:whatsapp_ui/utils/app_const_data.dart';

import '../utils/ui_styling.dart';

class UserChatsPage extends StatefulWidget{
  int sindex;
  UserChatsPage({required this.sindex});
  @override
  State<StatefulWidget> createState() {
   return UserChatePageState(mindex:sindex );
  }
}

class UserChatePageState extends State<StatefulWidget>{
  int mindex;
  UserChatePageState({required this.mindex});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor(),
      appBar: AppBar(
        backgroundColor: backGroundColor(),
        foregroundColor: whiteClr(),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(AppConstData.chatsdata[mindex]["profile_image"]),
            ),
            SizedBox(width: 20,),
            Text(AppConstData.chatsdata[mindex]["name"],style: TextStyle(fontSize: 18),),
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
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width/1.2,
                height: 60,
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  expands: true,
                  maxLines: null,
                  cursorColor: mainColor(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    hintText: "Message",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefix: IconButton(onPressed: (){}, icon: Icon(Icons.emoji_emotions_outlined,color: Colors.grey,)),
                    suffix: SizedBox(
                      width: 110,
                      height: 10,
                      // color: Colors.blueAccent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(Icons.link,color: Colors.grey)),
                          IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt_outlined,color: Colors.grey,)),
                        ],
                      ),
                    ),
                    filled: true,
                    fillColor: Color(0xff1F2C34),

                  ),
                ),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: mainColor(),
                  borderRadius: BorderRadius.circular(25)
                ),
                child: Center(child: Icon(Icons.send_rounded,size: 22,)),

              )
            ],
          )
        ],
      ),
    );

  }
}

