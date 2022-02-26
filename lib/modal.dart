
class UserData {
  late String name;
  late String? email;
  late String birthdate;
  late String uid;
  var foods = Map<String,Map<String,Map<String,String>>>();
  var history = Map<String,List<Map<String,String>>>();

  UserData({required this.name,required this.birthdate, required this.foods,
  required this.history, required this.email, required this.uid});

  //get data from map of firestore
  factory UserData.fromMap(Map<String,dynamic>? data){
      return UserData(
      name: data!["name"],
      email: data["email"]??"",
      birthdate:  data["birthdate"]??"",
      uid: data["uid"]??"",
      foods:  data["foods"]??{},
      history:  data["history"]??{},

    );
  }
  // send data to firestore
  Map<String,dynamic> toMap(){
    return ({
      "name": name,
      "email": email,
      "uid": uid,
      "birthdate": birthdate,
      "foods": foods,
      "history": history
    });
  }

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

// Thought of making different modals but the problem I would increase the boilerplate code