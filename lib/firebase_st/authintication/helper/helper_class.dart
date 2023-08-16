import 'package:firebase_auth/firebase_auth.dart';

class helper {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  get user => firebaseAuth.currentUser;

  Future<String?> SignUP({required String email, required String password}) async
  {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password);
      return null;
    }on FirebaseException catch (e)
    {
      return e.message;

    } catch (e) {
      print(e);
    }
  }

  Future<String?> SignIn({required String email, required String password})async
  {
    try
    {
    await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseException catch(e)
    {
      return e.message;

    } catch (e) {
      print(e);
    }
  }


  Future<String?> SignOut()async
  {
    await firebaseAuth.signOut();
  }
}