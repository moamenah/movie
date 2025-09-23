class UserModel{
  static const String getUser="userModel";

   String id;
   String name;
   String phone;


  UserModel({required this.id,required this.phone,required this.name});

  Map<String,dynamic> toJson(){
    return {
      "id":id,
      "name":name,
      "phone":phone,
    };
  }

  factory UserModel.fromJson(Map<String,dynamic>json,String id){
    return UserModel(
        id: id,
        phone: json["phone"]??"",
        name: json["name"]??"");
  }












}