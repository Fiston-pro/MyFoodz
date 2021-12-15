import 'package:flutter/material.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({ Key? key }) : super(key: key);

  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {

  List<String> foods = ['All','carbage','milk','apples','eggs','mushrooms']; 

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
              SizedBox(height: 50,),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text('Your budget this month', style: TextStyle(fontFamily:'Poppins', fontSize: 20,fontWeight: FontWeight.w400)),
                    SizedBox(height: 5,),
                    Text('500.78 Zl', style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w700, fontSize: 40, color: Colors.white),),
                    SizedBox(height: 10,)
                  ],
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  //margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  ),
                  child:                    
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
                      // Chart for chossen food

                  ),                  
                ),
            ],
          ),
        ),
      )
    );
  }
}