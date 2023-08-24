import 'package:flutter/material.dart';

class ProfileTabPage extends StatelessWidget {
  const ProfileTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const CircleAvatar(
          radius: 50.0,
          backgroundImage: AssetImage('assets/images/hassan.jpeg'),
        ),
        const Text(
          'Hassan ELsayed',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        ),
        Text(
          'FLUTTER DEVELOPER',
          style: TextStyle(
            fontSize: 20.0,
            letterSpacing: 2.5,
            color: Colors.teal.shade500,
            //fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20.0,
          width: 150.0,
          child: Divider(
            color: Colors.teal.shade100,
          ),
        ),
      const  ListTile(
          leading: Icon(Icons.mail,),
          title: Text('hassan.elsayed.hassan.26@gmail.com',style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        const  ListTile(
          leading: Icon(Icons.phone_android),
          title: Text('01013606611',style: TextStyle(fontWeight: FontWeight.bold),),
        )
      ],
    );
  }
}
