import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute(builder: (context) => const LoginScreen());
  }

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class User {
  String userId;

  User({this.userId});
}

class _LoginScreenState extends State<LoginScreen> {
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(userId: user.uid) : null;
  }

  Future signInWithEmailAndPassword(
      {String email, String password, BuildContext context}) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    User user;
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e.toString());
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _email = TextEditingController();
    TextEditingController _pass = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "News",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "Login to Your App",
              style: TextStyle(
                color: Colors.black,
                fontSize: 44,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "User email",
                prefixIcon: Icon(
                  Icons.mail,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _pass,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "User Password",
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
              ),
            ),
            const Text(
              "Don't Remember you password?",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: const Color(0xFF0069FE),
                elevation: 0.0,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onPressed: () async {
                  User user = await signInWithEmailAndPassword(
                      email: _email.text,
                      password: _pass.text,
                      context: context);
                  if (user != null) {
                    Navigator.of(context).pushReplacementNamed('/home');
                  } else {
                    print('error');
                  }
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/signup');
              },
              child: const Text(
                "Đăng ký",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
