import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myfoodz/Widgets/AddingBlock.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

class AddPage extends StatefulWidget {
  const AddPage({ Key? key }) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  // controllers of dialog input
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final itemController = TextEditingController();
  final qtyController = TextEditingController();
  final puController = TextEditingController();
  final tpController = TextEditingController();

  DateTime dateTime = DateTime.now();//initialising the date 
  var formatter = new DateFormat.yMd();//format for the date a choosen date
  List<Map<String,dynamic>> data = [];  //data for all items
  int totalPrice = 0;  //total price to be displayed big on the add page
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    itemController.dispose();
    qtyController.dispose();
    puController.dispose();
    tpController.dispose();
    super.dispose();
  }
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
              Text( totalPrice.toString() +' Zl', style: TextStyle(fontFamily: 'Poppins',fontSize: 40, fontWeight: FontWeight.w700, color: Colors.white),),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Done on '+ formatter.format(dateTime) ,style: TextStyle(fontFamily: 'Poppins',fontSize: 16,),),
                  IconButton(onPressed: (){datePicker();}, icon: Icon(Icons.calendar_today_rounded))
                ],
              ),
              SizedBox(height: 10,),
              AddingBlock(data: data,)
            ],
          ),
        )
      
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Map<String,dynamic> item = await itemInput(context);
          setState(() {
            data.add(item);
            totalPrice = totalPrice + int.parse(item["tp"]);
          });
        },
        backgroundColor: Colors.white,
        tooltip: 'Add',
        child: Icon(Icons.add, size: 24,color: Colors.black,),
      ),
    );
  }

  // add to list
  // called when you press the icon button
  void datePicker() async {
    dateTime = (await showRoundedDatePicker(
            context: context,
            initialDate: dateTime,
            firstDate: DateTime(dateTime.year - 1),
            lastDate: DateTime(dateTime.year + 1),
            borderRadius: 20,
            fontFamily: "Poppins",
            height: 300,
            theme: ThemeData(
              primaryColor: Color.fromRGBO(189, 225, 181, 1),
              primarySwatch: Colors.green,
              ),
          ))!;
    setState(() {});
  }


      //----------------------------------------------------------------------------- Dialog  box ----------------------------------------------------------------------------
      Future<Map<String,dynamic>> itemInput(BuildContext context) async {
          String metric = "/Kg";
          Map<String,String> data;
          return await showDialog(
            context: context,
            builder: (context) {
              String contentText = "Content of Dialog";
            return StatefulBuilder(
              builder: (context, setState) {
              return AlertDialog(
                  backgroundColor: Color.fromRGBO(189, 225, 181, 1),
                  title: const Text('Add new item', style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700, fontFamily: 'Poppins')),
                  content: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          validator: (text) {
                            return text!.isNotEmpty ? null : "Enter a name";
                          },
                          maxLength: 15,
                          controller: itemController,
                          cursorColor: Colors.black,
                          style: TextStyle(
                            fontFamily: 'Poppins'
                          ),
                          decoration:
                              InputDecoration(
                                hintText: "Enter an Item",
                                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                                hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,letterSpacing: 1),
                                counterText: "",
                                ),
                              
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                validator: (text) {
                                  return text!.isNotEmpty ? null : "No Qty";
                                },
                                keyboardType: TextInputType.number,
                                controller: qtyController,
                                maxLength: 5,
                                cursorColor: Colors.black,
                                style: TextStyle(
                                  fontFamily: 'Poppins'
                                ),
                                onChanged: (text){
                                  changeQty();
                                },
                                decoration:
                                    InputDecoration(
                                      hintText: "Qty",
                                      hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,letterSpacing: 1),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                                      counterText: "",
                                      border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                  ),
                                      ),
                                    
                              ),
                            ),
                            Text(" X ", style: TextStyle(fontWeight: FontWeight.w700,fontFamily: "Poppins"),),                            
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                validator: (text) {
                                  return text!.isNotEmpty ? null : "No P/U";
                                },
                                keyboardType: TextInputType.number,
                                controller: puController,
                                maxLength: 5,
                                cursorColor: Colors.black,
                                style: TextStyle(
                                  fontFamily: 'Poppins'
                                ),
                                onChanged: (text){
                                  changePu();
                                },
                                decoration:
                                    InputDecoration(
                                      hintText: "P/U",
                                      hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,letterSpacing: 1),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 20),                            
                                      counterText: "",
                                      border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                  ),
                                      ),
                                    
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              child: DropdownButton(
                                dropdownColor: Color.fromRGBO(189, 225, 181, 1),
                                alignment: AlignmentDirectional.bottomEnd,
                                iconEnabledColor: Colors.green,
                                icon: const Icon(Icons.keyboard_arrow_down), 
                                items: ["/Pc","/Kg","/Lb","/L"].map( (val) {
                                  return DropdownMenuItem(
                                    value: val,
                                    child: Text(val,style: TextStyle(fontWeight: FontWeight.w500),)
                                    );
                                }).toList(),                               
                                value: metric,                              
                                onChanged: (String? val){
                                  setState(() {
                                  metric = val!;
                                });
                                }),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("  = ",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w700),),
                            Expanded(
                              child: TextFormField(
                                validator: (text) {
                                  return text!.isNotEmpty ? null : "Enter a Total Price";
                                },
                                keyboardType: TextInputType.number,
                                controller: tpController,
                                maxLength: 5,
                                cursorColor: Colors.black,
                                style: TextStyle(
                                  fontFamily: 'Poppins'
                                ),
                                onChanged: (text){
                                  changeTp();
                                },
                                decoration:
                                    InputDecoration(
                                      hintText: "Total Price",
                                      hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,letterSpacing: 1),
                                      counterText: "",
                                      border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                  ),
                                      ),
                                    
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel', style: TextStyle(fontSize: 20, color: Colors.green,fontWeight: FontWeight.w700, fontFamily: 'Poppins')),
                            ),
                            TextButton(
                              onPressed: () => {
                                if (_formKey.currentState!.validate()) {
                                  data = {"name":itemController.text,"qty":qtyController.text,"p/u":puController.text,"metric": metric,"tp":tpController.text},
                                  cleanControllers(),
                                  Navigator.pop(context, data)
                                }
                                },
                              child: const Text('OK', style: TextStyle(fontSize: 20, color: Colors.green,fontWeight: FontWeight.w700, fontFamily: 'Poppins')),
                            ),],
                        )
                      ],
                    ),
                  ));
            },
          );
            });
        }

        void cleanControllers(){
          itemController.text = "";
          qtyController.text = "";
          puController.text = "";
          tpController.text = "";
        }
        // Balance the value of tp according qty and p/u
        void changePu(){
          if (qtyController.text.isNotEmpty && puController.text.isNotEmpty){
            tpController.text = (double.parse(qtyController.text)*double.parse(puController.text)).toStringAsFixed(2).toString();
          }else if (puController.text.isEmpty){
            tpController.text = "";
          }
        }
        // Balance the value of p/u according tp and qty
        void changeTp(){
          if (tpController.text != "" && qtyController.text != ""){
            puController.text = (double.parse(tpController.text)/double.parse(qtyController.text)).toStringAsFixed(2).toString();
          }else if (tpController.text != "" && puController.text != ""){
            puController.text = (double.parse(tpController.text)/double.parse(puController.text)).toStringAsFixed(2).toString();            
          }
        }
        // onchange of Qty text field
        void changeQty(){
          if (puController.text.isEmpty){
            changeTp();
          }
          if(tpController.text.isNotEmpty){
            changePu();
          } 
        }

}
