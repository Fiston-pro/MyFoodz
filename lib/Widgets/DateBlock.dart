import 'package:flutter/material.dart';
import 'package:myfoodz/Widgets/PastPurchases.dart';

class DateBlock extends StatefulWidget {
  final String timestamp;
  final List<Map<String, String>>? data;

  const DateBlock({ Key? key, required this.data, required this.timestamp }) : super(key: key);
  @override
  _DateBlockState createState() => _DateBlockState();
}

class _DateBlockState extends State<DateBlock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      child: Column(
        children: [
          Text('Last Week on Monday'+ widget.timestamp,style: TextStyle(fontFamily: 'Poppins', fontSize: 18),),
          SizedBox(height: 20,),
          PastPurchases(data: widget.data)
        ],
      ),
    );
  }
}