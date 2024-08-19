import 'package:flutter/material.dart';
import 'package:whatsapp_ui/ui_pages/user_chats_page.dart';
import 'package:whatsapp_ui/utils/app_const_data.dart';
import 'package:whatsapp_ui/utils/ui_styling.dart';

class ChatsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return ChatesPageState();
  }

}

class ChatesPageState extends State<StatefulWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: backGroundColor(),
      appBar: AppBar(
      backgroundColor: backGroundColor(),
        foregroundColor: Colors.white,
        title: Text("WhatsApp",),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.qr_code_scanner,color: whiteClr(),)),
          IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt_outlined,color: whiteClr(),)),
          PopupMenuButton(
               color: Color(0xff121B22),
              position: PopupMenuPosition.under,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              itemBuilder: (_){
              return [
              PopupMenuItem(
                child: Text("New group",style: TextStyle(color: whiteClr()),)),
              PopupMenuItem(
                child: Text("New broadcast",style: TextStyle(color: whiteClr()),)),
              PopupMenuItem(
                child: Text("Linked devices",style: TextStyle(color: whiteClr()),)),
              PopupMenuItem(
                child: Text("Starred messages",style: TextStyle(color: whiteClr()),)),
              PopupMenuItem(
                child: Text("Payments",style: TextStyle(color: whiteClr()),)),
              PopupMenuItem(
                child: Text("Settings",style: TextStyle(color: whiteClr()),)),

            ];
          })
        ],

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///SearchBar....
            Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                style: TextStyle(color: Colors.white),
                expands: true,
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search..",
                  suffix: Icon(Icons.search,color: Colors.white,),
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Color(0xff1F2C34),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/1.2,
              child: ListView.builder(itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UserChatsPage(sindex: index)));
                  },
                  child: ListTile(
                    minVerticalPadding: 8,
                    leading: CircleAvatar(
                      maxRadius: 26,
                      backgroundImage: AssetImage(AppConstData.chatsdata[index]["profile_image"]),
                    ),
                    title: Text(AppConstData.chatsdata[index]["name"],style: mytext17(),),
                    subtitle: Text(AppConstData.chatsdata[index]["subtext"],style: mytext13(),),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(AppConstData.chatsdata[index]["time"],style: mytext11(mycolr: Colors.green),),
                        CircleAvatar(
                            maxRadius:10,
                            backgroundColor: mainColor(),
                            child: Center(child: Text(AppConstData.chatsdata[index]["unread"],style: mytext11(mycolr: Colors.black),)))
                      ],
                    ),
                  ),
                );
              },
                itemCount: AppConstData.chatsdata.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainColor(),
        foregroundColor: Colors.black,
        onPressed: (){},
        child: Icon(Icons.message),
      ),

    );
  }

}