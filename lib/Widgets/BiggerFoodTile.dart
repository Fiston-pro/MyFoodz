import 'package:flutter/material.dart';

class BiggerFoodTile extends StatefulWidget {
  Map<String,dynamic> data;
  BiggerFoodTile({ Key? key,required this.data }) : super(key: key);

  @override
  _BiggerFoodTileState createState() => _BiggerFoodTileState();
}

class _BiggerFoodTileState extends State<BiggerFoodTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 3,child: Text(widget.data["name"],overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'Poppins', fontSize: 17),)),
        Expanded(flex: 2,child: Text(widget.data["qty"],style: TextStyle(fontFamily: 'Poppins', fontSize: 17),)),
        Expanded(flex: 2,child: Text(widget.data["p/u"] + widget.data["metric"],style: TextStyle(fontFamily: 'Poppins', fontSize: 17),)),        
        Expanded(flex: 2,child: Text(widget.data["tp"],style: TextStyle(fontFamily: 'Poppins', fontSize: 17),))
      ],
    );
  }
}