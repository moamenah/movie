import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuth{


 Future <void> signUp(String email ,String password)async{
   try {
     final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
       email: email.trim(),
       password: password.trim(),
     );
   } on FirebaseAuthException catch (e) {
   if (e.code == 'weak-password') {
   print('The password provided is too weak.');
   } else if (e.code == 'email-already-in-use') {
   print('The account already exists for that email.');
   }
   } catch (e) {
   print(e);
   }

 }


 //*******


Future <void> logIn(String email ,String password)async{
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim()
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}


//*************...

Future <void> signOut()async{
  await FirebaseAuth.instance.signOut();
}
//*******




  static Future <void> resetPassword(String email)async{
    try{
      await  FirebaseAuth.instance.sendPasswordResetEmail(
          email: email.trim());
    }on FirebaseAuthException catch(e){
      throw e;
    }
  }



  static User? getCurrentUser(){
    return FirebaseAuth.instance.currentUser;
  }



}