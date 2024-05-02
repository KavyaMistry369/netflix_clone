import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user_model.dart';

class AuthService {

  AuthService._();

  static final AuthService authService = AuthService._();

  GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<bool>signOut()async{
    await firebaseAuth.signOut();
    googleSignIn.signOut();
    return true;
  }

  Future<UserModel>signInWithGoogle() async {

    GoogleSignInAccount? account = await googleSignIn.signIn();
    GoogleSignInAuthentication authentication = await account!.authentication;

    UserModel userModel = UserModel(image:account.photoUrl ?? "", name: account.displayName!, email: account.email);
    firebaseFirestore.collection('users').doc(account.email).set({
      'name':account.displayName,
      'email':account.email,
    },SetOptions(merge: true));

    AuthCredential authCredential = GoogleAuthProvider.credential(
      idToken: authentication.idToken,
      accessToken: authentication.accessToken,
    );

    FirebaseAuth.instance.signInWithCredential(authCredential);

    log(userModel.email);

    return userModel;
  }

  signInWithPasswordUsername(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      firebaseFirestore.collection('users').doc(userCredential.user!.email).set({
        'uid':userCredential.user!.uid,
        'email':email,
      },SetOptions(merge: true));
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  signUpWithPasswordUsername(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      firebaseFirestore.collection('users').doc(userCredential.user!.email).set({
        'uid':userCredential.user!.uid,
        'email':email,
      });
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

}