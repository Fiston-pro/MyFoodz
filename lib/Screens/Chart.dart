import 'package:flutter/material.dart';
import 'package:myfoodz/Widgets/chartWidget.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({ Key? key }) : super(key: key);

  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {

  late List<String> foods; // Add a way to get data from the object 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(189, 225, 181, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('MY FOODZ',style: TextStyle(fontSize: 23, fontFamily: 'Poppins',color: Colors.white,  fontWeight: FontWeight.w700)),
                  ],
                ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 50,),
                        Text('Your budget this month', style: TextStyle(fontFamily:'Poppins', fontSize: 20,fontWeight: FontWeight.w400)),
                        SizedBox(height: 5,),
                        Text('500.78 Zl', style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w700, fontSize: 40, color: Colors.white),),
                        SizedBox(height: 10,),
                        
                      ],
                    ),
                  ],
                ),
              ),
              
              Expanded(
                flex: 4,
                child: Container(
                  //margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                  ),
                  child: 
                          Stack(
                            children: [
                             BarChartSample3(),
                              ListView.builder(
                          itemCount: foods.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
                              child: 
                              foods[index] == 'milk' ?
                              Text(foods[index],
                              style: TextStyle( color: Colors.green, fontFamily: 'Poppins', fontSize: 16),)
                              :
                              Text(foods[index],
                              style: TextStyle(fontFamily: 'Poppins', fontSize: 16),)
                              ,
                            );
                          },
                        ),
                            ],
                            )
                  ),    
                ),
            ],
          ),
        ),
      )
    );
  }
}
