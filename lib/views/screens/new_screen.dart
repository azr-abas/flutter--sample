import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_login/main.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
}

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(
          height: 40,
        ),
        Padding(padding: EdgeInsets.all(8)),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            height: 110,
            width: 100,
            child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFblndSZeUbaKJTXoUSPh0tpT_VhOLo_UnoQ&usqp=CAU'),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ListTile(
          title: Text('Name'),
          subtitle: Text('Ali Hussain'),
          leading: Icon(CupertinoIcons.person),
          trailing: Icon(
            Icons.arrow_forward,
            color: Colors.grey,
          ),
          tileColor: Colors.white,
        ),
        SizedBox(
          height: 50,
        ),
        ListTile(
          title: Text('Email'),
          subtitle: Text('Ali@gamil.com'),
          leading: Icon(Icons.email),
          trailing: Icon(
            Icons.arrow_forward,
            color: Colors.grey,
          ),
          tileColor: Colors.white,
        ),

         SizedBox(
          height: 50,
        ),
        ListTile(
          title: Text('phone'),
          subtitle: Text('090078601'),
          leading: Icon(Icons.phone),
          trailing: Icon(
            Icons.arrow_forward,
            color: Colors.grey,
          ),
          tileColor: Colors.white,
        )
      ],
    ));
  }
}
