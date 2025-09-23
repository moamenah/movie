import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/core/firebase/user_model_store.dart';

class FireBaseFireStore{

  static CollectionReference<UserModel> getUser(){
  return  FirebaseFirestore.instance.collection(UserModel.getUser).
    withConverter<UserModel>(
      fromFirestore: (snapshot, options) =>UserModel.fromJson(snapshot.data()!, snapshot.id) ,
      toFirestore: (value, options) => value.toJson(),);
  }


 static Future<void> addUser(UserModel model){
 var moviesCollection =getUser(); // collection .
 DocumentReference <UserModel> docRef  =moviesCollection.doc(); // documents
 model.id =docRef.id; // AUTO id
   return docRef.set(model);
  }




  static Future<void> updateUser(UserModel model) {
    var usersCollection = getUser();
    return usersCollection.doc(model.id).update(model.toJson());
  }

  static Future<void> deleteUser(String id) {
    var usersCollection = getUser();
    return usersCollection.doc(id).delete();
  }




}