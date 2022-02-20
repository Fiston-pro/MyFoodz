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
                  TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Cancel',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700, fontFamily: 'Poppins',fontSize: 25),)),
                  TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Save',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700, fontFamily: 'Poppins',fontSize: 25),)),
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
        onPressed: () async {
          Object item = await itemInput(context);
        },
        backgroundColor: Colors.white,
        tooltip: 'Add',
        child: Icon(Icons.add, size: 24,color: Colors.black,),
      ),



    );
  }
      Future<Object> itemInput(BuildContext context) async {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  backgroundColor: Color.fromRGBO(189, 225, 181, 1),
                  title: const Text('Add new item', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700, fontFamily: 'Poppins')),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        maxLength: 20,
                        cursorColor: Colors.black,
                        style: TextStyle(
                          fontFamily: 'Poppins'
                        ),
                        decoration:
                            InputDecoration(
                              
                              hintText: "Enter an Item",
                              hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,letterSpacing: 1),
                              filled: true,
                              fillColor: Colors.white,
                              counterText: "",
                              border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(0)
                          ),
                              ),
                            
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        maxLength: 5,
                        cursorColor: Colors.black,
                        style: TextStyle(
                          fontFamily: 'Poppins'
                        ),
                        decoration:
                            InputDecoration(
                              hintText: "Enter the Quantity",
                              hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,letterSpacing: 1),
                              filled: true,
                              fillColor: Colors.white,
                              counterText: "",
                              border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                          ),
                              ),
                            
                      ),
                      TextField(
                        maxLength: 5,
                        cursorColor: Colors.black,
                        style: TextStyle(
                          fontFamily: 'Poppins'
                        ),
                        decoration:
                            InputDecoration(
                              
                              hintText: "Enter the Total Price",
                              hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,letterSpacing: 1),
                              filled: true,
                              fillColor: Colors.white,
                              counterText: "",
                              border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                          ),
                              ),
                            
                      ),
                      
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700, fontFamily: 'Poppins')),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700, fontFamily: 'Poppins')),
                    ),]);
            },
          );
        }
}
