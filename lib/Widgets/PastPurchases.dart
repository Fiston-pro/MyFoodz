import 'package:flutter/material.dart';
import 'package:myfoodz/Widgets/FoodTile.dart';

class PastPurchases extends StatefulWidget {
  final List<Map<String, String>>? data;

  const PastPurchases({ Key? key, this.data }) : super(key: key);

  @override
  _PastPurchasesState createState() => _PastPurchasesState();
}

class _PastPurchasesState extends State<PastPurchases> {
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
              Expanded(flex: 2, child:Text("Price",style: TextStyle(fontFamily: 'Poppins', fontSize: 18, fontWeight: FontWeight.w600),))
            ],
          ),
          ListView.builder(
            itemCount: widget.data!.length,
            itemBuilder: (context, index){
                return FoodTile(data: widget.data![index]);
            }
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 5, child: Text('Total', style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600,fontSize: 18),)),
              Expanded(flex: 2, child:Text(' 40.01', style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600,fontSize: 18),))
            ],
          )
        ],
      ),
    );
  }
}