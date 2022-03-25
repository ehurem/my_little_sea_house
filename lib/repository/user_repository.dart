import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_little_sea_house/models/user_model.dart' as user_model;

class UserRepository {
  final FirebaseAuth _firebaseAuth;

  UserRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  user_model.User? _userFromFirebaseUserCredential(
      UserCredential userCredential) {
    return userCredential.user != null
        ? user_model.User(
            id: userCredential.user!.uid,
            displayName:
                userCredential.user!.displayName ?? 'Display name is null.')
        : null;
  }

  user_model.User? _userFromFirebaseUser(User? firebaseUser) {
    return firebaseUser != null
        ? user_model.User(
            id: firebaseUser.uid,
            displayName: firebaseUser.displayName ?? 'Display name is null.',
            email: firebaseUser.email,
            phone: firebaseUser.phoneNumber,
            imageUrl: firebaseUser.photoURL)
        : null;
  }

  // Sign in Anonimously
  Future<user_model.User?> signInAnonimously() async {
    try {
      UserCredential result = await _firebaseAuth.signInAnonymously();
      return _userFromFirebaseUserCredential(result);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<user_model.User?> signInWithCredentials(
      {required String email, required String password}) async {
    UserCredential userCredential =
        await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _userFromFirebaseUserCredential(userCredential);
  }

  Future<user_model.User?> signUp(
      {required String email, required String password}) async {
    UserCredential userCredential =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return _userFromFirebaseUserCredential(userCredential);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  Future<bool> isSignedIn() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future<user_model.User?> getUser() async {
    return _userFromFirebaseUser(_firebaseAuth.currentUser);
  }
}
