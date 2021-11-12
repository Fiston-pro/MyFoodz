import 'package:flutter/material.dart';

class DateBlock extends StatefulWidget {
  const DateBlock({ Key? key }) : super(key: key);

  @override
  _DateBlockState createState() => _DateBlockState();
}

class _DateBlockState extends State<DateBlock> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Last Week on Monday',style: TextStyle(fontFamily: 'Poppins'),)
      ],
    );
  }
}