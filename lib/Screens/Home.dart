import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfoodz/Widgets/DateBlock.dart';
import 'package:myfoodz/modal.dart';
import 'package:myfoodz/providers.dart';


class HomePage extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    //provider stuff
    UserData user= ref.watch(userDataProvider);
    List<dynamic> timestamps = ref.read(userDataProvider).history.keys.toList();
    return Scaffold(
      backgroundColor: Color.fromRGBO(189, 225, 181, 1),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Button to take you to the chart page
                IconButton(onPressed: (){Navigator.pushNamed(context, '/Chart');}, icon: Icon(Icons.bar_chart_rounded,size: 40,color: Colors.white,)),
                Text('MY FOODZ',style: TextStyle(fontSize: 23, fontFamily: 'Poppins',color: Colors.white,  fontWeight: FontWeight.w700)),
                // Button to take you to the adding page
                IconButton(onPressed: () async {
                  await Navigator.pushNamed(context, '/Add');
                  }, icon: Icon(Icons.add_rounded,size: 40,color: Colors.white,),)
              ],
            ),
            SizedBox(height: 100,),
            Column(
              children: [
                Text('Welcome Back,', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25, fontFamily: 'Poppins', color: Colors.white),),
                Text(user.name, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 40, fontFamily: 'Poppins', color: Colors.white),)
              ],
            ),
            SizedBox(height: 50,),
            timestamps.isEmpty ? Text('There is no data'):
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: timestamps.length,
                itemBuilder: (context,index) {
                  // we pass only the timestamp down the widget
                  return DateBlock(timestamp: timestamps[index],data: ref.read(userDataProvider).history[timestamps[index]]);
                }),
            )
          ],
        ),
      ),
    );
  }
}