import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //google service
  Signin_With_Google() async {
    //begin the sign in process

    final GoogleSignInAccount? guser = await GoogleSignIn().signIn();

    ///obtain auth details from request
    final GoogleSignInAuthentication gAuth = await guser!.authentication;

    ///*create a new user credential
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    ///finally signin
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
