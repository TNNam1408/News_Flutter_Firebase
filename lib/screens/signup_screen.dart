import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute(builder: (context) => const SignUpScreen());
  }

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class User{
  String userId;

  User({this.userId});
}
class _SignUpScreenState extends State<SignUpScreen> {

  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(userId: user.uid):null;
  }
  Future signUpWithEmailAndPassword({String email, String password, BuildContext context}) async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    User user;
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);
    }
    catch(e){
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
                  fontSize: 40,
                  fontWeight: FontWeight.bold
              ),
            ),

            const Text(
              "Đăng ký tài khoản của bạn",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
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
                hintText: "email",
                prefixIcon: Icon(Icons.mail,color: Colors.black,),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _pass,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "mật khẩu ",
                prefixIcon: Icon(Icons.lock,color: Colors.black,),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Container(

              width: double.infinity,
              child: RawMaterialButton(

                fillColor: Colors.green,
                elevation: 0.0,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onPressed: ()async{
                  User user = await signUpWithEmailAndPassword(email: _email.text, password: _pass.text,context: context);
                  if(user !=null){
                    Navigator.of(context).pushReplacementNamed('/login');
                  }else{
                    print('error sign up');
                  }
                },
                child: const Text("Đăng ký",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/login');
              },
              child: const Text(
                "Đăng nhập",
                style: TextStyle(fontSize: 25, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
