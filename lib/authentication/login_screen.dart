import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:waste_app/authentication/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
bool _obscureText = true;
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 200),
                Text(
                    "Welcome to WasteApp",
                style: TextStyle(
                  fontSize: 16),
                ),
                SizedBox(height: 5),
                Text(
                  "Login",
                  style: TextStyle(
                    color: Color(0xFF7FB77E),
                    fontSize: 42,
                    fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 70),
                Container(
                  decoration:
                  BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffE0E0E0),
                  ),
                  child:
                  TextField(
                    decoration: InputDecoration(
                      hintText: "E-Mail",
                      hintStyle: TextStyle(
                          fontSize: 12,
                          color: Color(0XFF7F7F7F)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.white
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  decoration:
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffE0E0E0),
                  ),
                  child:
                  TextField(
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(
                          fontSize: 12,
                          color: Color(0XFF7F7F7F)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.white
                          )
                      ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText ? Icons.visibility : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        )
                    ),
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  RichText(
                      text: TextSpan(
                          text: "Belum punya akun?",
                          style: TextStyle(
                              color: Color(0xFF7FB77E),
                              fontSize: 11
                          ),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap=(){
                              Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) => RegisterScreen(),
                                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                    const begin = Offset(1.0, 0.0);
                                    const end = Offset.zero;
                                    const curve = Curves.easeInOut;

                                    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                                    var offsetAnimation = animation.drive(tween);

                                    return SlideTransition(
                                      position: offsetAnimation,
                                      child: child,
                                    );
                                  },
                                  transitionDuration: const Duration(milliseconds: 1000),
                                ),
                              );
                          },
                            text: ' Daftar Sekarang',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            )
                          )
                        ]
                      ),
                  ),
                  SizedBox(height: 80),
                  TextButton(
                    onPressed: (){
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color(0xFF7FB77E)),
                      shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      ),
                      minimumSize: MaterialStateProperty.all(Size(350, 50)), // Set your custom width and height
                    ),
                    child: const Text(
                        "Login Now",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600
                        )
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
