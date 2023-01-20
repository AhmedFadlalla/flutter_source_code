import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessengerScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MessengerScreenState();
}

class _MessengerScreenState extends State<MessengerScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/34492145?v=4"),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text("Chats",
                      style: TextStyle(fontSize: 20, color: Colors.black))
                ],
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 20.0,
                        child: Icon(Icons.camera_alt))),
                IconButton(
                    onPressed: () {},
                    icon: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 20.0,
                        child: Icon(Icons.edit)))
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.all(2.0),
                        child: TextField(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(60.0)),
                                fillColor: Colors.grey[200],
                                filled: true,
                                labelText: "search",
                                labelStyle:
                                    TextStyle(fontSize: 20, color: Colors.blue),
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                )),
                            keyboardType: TextInputType.text,
                            style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 100.0,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index)=> buildStoryItem(),
                            separatorBuilder: (context,index)=>SizedBox(width: 20.0,),
                          itemCount: 10,),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context,index)=>buildChatItem(),
                              separatorBuilder: (context,index)=>SizedBox(height: 20.0,),
                              itemCount: 10),




                    ]),
              ),
            )));
  }

  Widget buildChatItem()=> Row(

      children: [

        Stack(
            alignment: Alignment.bottomRight,
            children:[
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/34492145?v=4"),
              ),
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.green,
              )

            ]
        ),
        SizedBox(width: 8.0,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Ahmed M.Fadlalla ",style: TextStyle(fontSize: 20,color: Colors.black),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,),
              SizedBox(height: 6.0,),
              Row(
                children: [
                  Expanded(
                      child: Text(
                        "My Name is Ahmed My Name is Ahmed My Name is Ahmed  My Name is Ahmed ",
                        style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      width: 7.0,
                      height: 7.0,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Text("11:30 PM",style: TextStyle(fontSize: 20,color: Colors.black),)

                ],
              ),


            ],
          ),
        )

      ],
    );
  Widget buildStoryItem()=>Container(
    child: Column(children: [
      Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                "https://avatars.githubusercontent.com/u/34492145?v=4"),
            radius: 20.0,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                bottom: 3.0, end: 3.0),
            child: CircleAvatar(
              radius: 7.0,
              foregroundColor: Colors.green,
            ),
          )
        ],
      ),
      SizedBox(
        height: 6.0,
      ),
      Text(
        "Ahmed M.Fadlalla",
        style: TextStyle(
            fontSize: 20.0, color: Colors.black),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      )
    ]),
  );



}
