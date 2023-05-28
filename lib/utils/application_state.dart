import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum ApplicationLoginState { loggedOut, loggedIn }

class ApplicationState extends ChangeNotifier {
  User? user;
  GoogleSignInAccount? _user;

  GoogleSignInAccount get userGG => _user!;
  ApplicationLoginState loginState = ApplicationLoginState.loggedOut;

  final googleSignIn = GoogleSignIn();

  ApplicationState() {
    init();
  }

  Future<void> init() async {
    FirebaseAuth.instance.userChanges().listen((userFir) {
      if (userFir != null) {
        loginState = ApplicationLoginState.loggedIn;
        user = userFir;
      } else {
        loginState = ApplicationLoginState.loggedOut;
      }
      notifyListeners();
    });
  }

  Future<void> signIn(String email, String password,
      void Function(FirebaseAuthException e) errorCallBack) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      errorCallBack(e);
    }
  }

  Future<void> signUp(String email, String password,
      void Function(FirebaseAuthException e) errorCallBack) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      errorCallBack(e);
    }
  }

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken
      );

      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      User? userGG = userCredential.user;

      if (userGG != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          await FirebaseFirestore.instance.collection('users').doc(userGG.uid).set({
            'email': userGG.email,
            'name': userGG.displayName,
            'imgUrl': userGG.photoURL,
            'role': 1
          });
        }
      }
    } catch(e) {
      print(e.toString());
    }
    notifyListeners();
  }

  void signOut() async{
    await FirebaseAuth.instance.signOut();
  }

  Future signOutGG() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
