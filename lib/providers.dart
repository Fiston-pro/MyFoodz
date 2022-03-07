//state notifier
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfoodz/modal.dart';

class UserDataNotifier extends StateNotifier<UserData> {
  UserDataNotifier() : super(_initialValue);
  static const _initialValue = UserData(name:'',email:'',birthdate:'',uid:'',foods:{},history:{});
  

  //get data from map of firestore
  void fromMap(Map<String,dynamic>? data){
      state = state.copyWith(name: state.name,email: state.email,birthdate:state.birthdate,uid:state.uid,foods:state.foods,history:state.history);
  }
  // send data to firestore
  Map<String,dynamic> toMap(){
    return ({
      "name": state.name,
      "email": state.email,
      "uid": state.uid,
      "birthdate": state.birthdate,
      "foods": state.foods,
      "history": state.history
    });
  }
  //add data to history 
  void addHistory(var homeData){
    state = state.copyWith(history: homeData);
  }
  //------- FOODS -----------//
  //sends all the foods he ate 
  List getFoods(){
    return state.foods.keys.toList();
  }
  //sends timestamps of a certain food
  Map? getTimestampsFood(String item){
    return state.foods[item];
  }
  //-------- HISTORY ---------------//
  //sends all dates you shopped
  List getTimestampsShop(){
    return state.history.keys.toList();
  }
  //sends all items shopped of a specific date
  List? getThingsShopped(String date){
    return state.history[date];
  }

}