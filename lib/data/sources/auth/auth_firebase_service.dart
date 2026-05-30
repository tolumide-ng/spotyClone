import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/login_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createUserReq);

  Future<Either> login(LoginUserReq loginUserReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );

      // Add a small delay to ensure native platform channels are ready
      // await Future.delayed(const Duration(milliseconds: 500));

      try {
        await FirebaseFirestore.instance.collection('Users').add({
          'name': createUserReq.fullName,
          'email': data.user?.email,
        });
      } catch (firestoreError) {
        // If Firestore fails, the auth user is already created
        // User signup is still successful even if Firestore write fails
        print('Firestore error (non-fatal): $firestoreError');
      }

      return Right({"message": "Signup was successful"});
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = 'An error occurred during signup.';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> login(LoginUserReq user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      return Right({"message": "Login was successful"});
    } on FirebaseAuthException catch (e) {
      String message = 'Invalid email or password';
      return Left(message);
    }
  }
}
