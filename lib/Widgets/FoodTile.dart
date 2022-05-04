import 'package:flutter/material.dart';

class FoodTile extends StatefulWidget {
  final Map<String, dynamic> data;
  const FoodTile({ Key? key, required this.data }) : super(key: key);

  @override
  _FoodTileState createState() => _FoodTileState();
}

class _FoodTileState extends State<FoodTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3,child: Text(widget.data["name"],overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'Poppins', fontSize: 17),)),
        Expanded(flex: 2,child: Text(widget.data["qty"],style: TextStyle(fontFamily: 'Poppins', fontSize: 17),)),
        Expanded(flex: 2,child: Text(widget.data["tp"],style: TextStyle(fontFamily: 'Poppins', fontSize: 17),))
      ],
    );
  }
}