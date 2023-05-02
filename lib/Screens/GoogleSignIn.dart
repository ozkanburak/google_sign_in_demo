import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_with_google/Authentication/AuthServices.dart';
import 'package:sign_in_with_google/Screens/Home.dart';
class GoogleSignIn extends StatefulWidget {
  const GoogleSignIn({Key? key}) : super(key: key);

  @override
  State<GoogleSignIn> createState() => _GoogleSignInState();
}

class _GoogleSignInState extends State<GoogleSignIn> {
  final authServices _auth = authServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title:const Text("Google Sign in"),
      // ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/juja-han-HU-uL54pfQI-unsplash.jpg",),fit: BoxFit.cover
          )
        ),
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(height:460),
                
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    width: 330,
                    child:  OutlinedButton(
                      onPressed:() async {

                        User? myuser = await _auth.signInWithGoogle(context:context);
                        if(myuser!=null)
                          {
                            Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>Home(user: myuser,)));
                          }
                    },
                      style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(25),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18),side:const BorderSide(color: Colors.redAccent,width: 30)),backgroundColor: Colors.white,elevation:9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 14),
                            child: Tab(child: Image(image:AssetImage("assets/googlelogo-removebg-preview.png"),),),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text("Continue with Google",style: TextStyle(color: Colors.black,fontSize: 17)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                
                
              ],
            )
          ],
        ),
      ),
    );
  }
}



