import 'package:flutter/material.dart';
import 'package:myfoodz/Widgets/AddingBlock.dart';

class AddPage extends StatefulWidget {
  const AddPage({ Key? key }) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(189, 225, 181, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: (){}, child: Text('Cancel',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700, fontFamily: 'Poppins',fontSize: 25),)),
                  TextButton(onPressed: (){}, child: Text('Save',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700, fontFamily: 'Poppins',fontSize: 25),)),
                ],
              ),
              SizedBox(height: 20,),
              Text('Total Price', style: TextStyle(fontFamily: 'Poppins', fontSize: 18, fontWeight: FontWeight.w600),),
              Text('78.02 Zl', style: TextStyle(fontFamily: 'Poppins',fontSize: 40, fontWeight: FontWeight.w700, color: Colors.white),),
              SizedBox(height: 20,),
              Text('Done on 11/05/2021',style: TextStyle(fontFamily: 'Poppins',fontSize: 16,),),
              SizedBox(height: 10,),
              AddingBlock()
            ],
          ),
        )
      
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.white,
        tooltip: 'Add',
        child: Icon(Icons.add, size: 24,color: Colors.black,),
      ),
    );
  }
}
