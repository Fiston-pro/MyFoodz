import 'package:flutter/material.dart';

class FoodTile extends StatefulWidget {
  const FoodTile({ Key? key }) : super(key: key);

  @override
  _FoodTileState createState() => _FoodTileState();
}

class _FoodTileState extends State<FoodTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 3,child: Text("tomatoes",overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'Poppins', fontSize: 17),)),
        Expanded(flex: 2,child: Text(" 50",style: TextStyle(fontFamily: 'Poppins', fontSize: 17),)),
        Expanded(flex: 2,child: Text(" 2.85",style: TextStyle(fontFamily: 'Poppins', fontSize: 17),))
      ],
    );
  }
}