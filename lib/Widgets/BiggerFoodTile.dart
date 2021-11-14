import 'package:flutter/material.dart';

class BiggerFoodTile extends StatefulWidget {
  const BiggerFoodTile({ Key? key }) : super(key: key);

  @override
  _BiggerFoodTileState createState() => _BiggerFoodTileState();
}

class _BiggerFoodTileState extends State<BiggerFoodTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 3,child: Text("tomatoes",overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'Poppins', fontSize: 17),)),
        Expanded(flex: 2,child: Text("50",style: TextStyle(fontFamily: 'Poppins', fontSize: 17),)),
        Expanded(flex: 2,child: Text("3.2/Kg",style: TextStyle(fontFamily: 'Poppins', fontSize: 17),)),        
        Expanded(flex: 2,child: Text("2.85",style: TextStyle(fontFamily: 'Poppins', fontSize: 17),))
      ],
    );
  }
}