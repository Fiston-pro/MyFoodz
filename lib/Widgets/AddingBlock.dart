import 'package:flutter/material.dart';
import 'package:myfoodz/Widgets/BiggerFoodTile.dart';

class AddingBlock extends StatefulWidget {
  List<Map<String, dynamic>> data;
  AddingBlock( { Key? key, required this.data }) : super(key: key);

  @override
  _AddingBlockState createState() => _AddingBlockState();
}

class _AddingBlockState extends State<AddingBlock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 10, 0, 10),
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomLeft: Radius.circular(10))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 3, child:Text("Name",style: TextStyle(fontFamily: 'Poppins',fontSize: 18, fontWeight: FontWeight.w600 ),)),
              Expanded(flex: 2, child:Text("Qty",style: TextStyle(fontFamily: 'Poppins', fontSize: 18, fontWeight: FontWeight.w600),)),
              Expanded(flex: 2, child:Text("P/U",style: TextStyle(fontFamily: 'Poppins', fontSize: 18, fontWeight: FontWeight.w600),)),
              Expanded(flex: 2, child:Text("TP",style: TextStyle(fontFamily: 'Poppins', fontSize: 18, fontWeight: FontWeight.w600),))  
            ],
          ),
          SizedBox(height: 10,),
          Column(
            children: widget.data.map((val) => BiggerFoodTile( data: val)).toList() ,
          )
        ]
    )
    );
}}