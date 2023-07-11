import 'package:demo0/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../widgets/apptext.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);



  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 void signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential =
    await FirebaseAuth.instance.signInWithCredential(credential);
    if (
    userCredential.user!=null
    )
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
      }

    print(userCredential.user?.displayName);
  }

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xffDCD964), Color(0xff235D3A)],
  ).createShader(
    const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
  );

  final  loginkey = GlobalKey<FormState>();
  var visibility = true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(40),
              ),
              child: InkWell(
                onTap: signInWithGoogle,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/googleimg.png',
                      width: 50,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      'Sign In With Google',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));


  }
}
