import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:myfoodz/Widgets/FoodTile.dart';

class PastPurchases extends StatefulWidget {
  final List<dynamic>? data; //List of purchases done on a particular timestamp

  const PastPurchases({ Key? key, this.data }) : super(key: key);

  @override
  _PastPurchasesState createState() => _PastPurchasesState();
}

class _PastPurchasesState extends State<PastPurchases> {
  var totalOfPurchases = 0;
  getTotal(BuildContext context){
    print("fiston is the best");
    for(int i = 0; i < widget.data!.length; i++) {
      totalOfPurchases = totalOfPurchases + int.parse(widget.data![i]["tp"]);
    }
  }

  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((_) => getTotal(context));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(40, 0, 40, 10),
      padding: EdgeInsets.fromLTRB(25, 10, 0, 10),
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomLeft: Radius.circular(10))),
      child: Expanded(
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
            SizedBox(height: 20,),
            widget.data!.isEmpty ? Text('There is data'):
            SizedBox(
              height: 50,
              child: Expanded(
                child: ListView.builder(
                  itemCount: widget.data!.length,
                  itemBuilder: (context, index){
                      return FoodTile(data: widget.data![index]);
                  }
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 5, child: Text('Total', style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600,fontSize: 18),)),
                Expanded(flex: 2, child:Text('${totalOfPurchases.toString()}', style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600,fontSize: 18),))
              ],
            )
          ],
        ),
      ),
    );
  }
}