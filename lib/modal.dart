
class User {
  late String name;
  late String birthdate;
  var foods = Map<String,Map<String,Map<String,String>>>();
  var history = Map<String,List<Map<String,String>>>();

  User({required this.name,required this.birthdate});
  //sends the name
  String get_name(){
    return name;
  }
  //sends the birthday
  String get_birthdate(){
    return birthdate;
  }
  //sends all the foods he ate 
  List get_foods(){
    return foods.keys.toList();
  }
  //sends timestamps of a certain food
  Map? get_timestamps_food(String item){
    return foods[item];
  }
  //sends all dates you shopped
  List get_timestamps_shop(){
    return history.keys.toList();
  }
  //sends all items shopped of a specific date
  List? get_things_shopped(String date){
    return history[date];
  }

}