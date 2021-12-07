import 'package:firebase_auth/firebase_auth.dart';

class ControllerCadastro {
  signup(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((userCredential) => print(userCredential.user!.email));
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
