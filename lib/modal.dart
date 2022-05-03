
class UserData {
  final String name;
  final String? email;
  final String birthdate;
  final String uid;
  final Map<String,Map<String,Map<String,String>>> foods;
  final Map<dynamic,List<Map<String,dynamic>>> history;

  const UserData({required this.name,required this.birthdate, required this.foods,
  required this.history, required this.email, required this.uid});

  UserData copyWith({String? name,String? email,String? birthdate,String? uid, Map<String,Map<String,Map<String,String>>>? foods,
  Map<dynamic,List<Map<String,dynamic>>>? history}) {
    return UserData(
      name: name ?? this.name ,
      email: email ?? this.email,
      birthdate:  birthdate ?? this.birthdate,
      uid: uid ?? this.uid,
      foods:  foods ?? this.foods,
      history:  history ?? this.history,
    );
  }

  //--------------- we don't need fromMap and toMap because there is the providers------------
  //get data from map of firestore
  UserData fromMap(Map<String,dynamic>? data){
      return UserData(
      name: data!["name"] ?? this.name,
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
}

// Thought of making different modals but the problem I would increase the boilerplate code