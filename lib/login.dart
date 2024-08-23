import 'package:digtal_lock/lockd.dart';
import 'package:digtal_lock/signup.dart';
import 'package:flutter/material.dart';

class login extends StatelessWidget {
  login({Key? key});

  void _login(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LockScreen()));
  }

  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("image/img2.png"), // Replace with your actual image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 200),
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white), // Example: Set text color to white
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value != null && value.isNotEmpty && value.length < 5) {
                              return "Your username must be more than 5 characters";
                            } else if (value == null) {
                              return "Username can't be null";
                            }
                            return null;
                          },
                          controller: _email,
                          style: TextStyle(color: Colors.white), // Example: Set text color to white
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.white), // Example: Set border color to white
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.white), // Example: Set enabled border color to white
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.white), // Example: Set focused border color to white
                            ),
                            hintText: "Enter Username",
                            hintStyle: TextStyle(color: Colors.white60), // Example: Set hint text color to white with opacity
                            prefixIcon: Icon(Icons.email, color: Colors.white), // Example: Set prefix icon color to white
                          ),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          validator: (value) {
                            if (value != null && value.isNotEmpty && value.length < 5) {
                              return "Your password must be more than 5 characters";
                            } else if (value == null) {
                              return "Password can't be null";
                            }
                            return null;
                          },
                          controller: _password,
                          obscureText: true,
                          style: TextStyle(color: Colors.white), // Example: Set text color to white
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.white), // Example: Set border color to white
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.white), // Example: Set enabled border color to white
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.white), // Example: Set focused border color to white
                            ),
                            hintText: "Type Your Password",
                            hintStyle: TextStyle(color: Colors.white60), // Example: Set hint text color to white with opacity
                            prefixIcon: Icon(Icons.lock_outline, color: Colors.white), // Example: Set prefix icon color to white
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      _login(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent.withOpacity(0.8), // Example: Set button background color with opacity
                      padding: EdgeInsets.symmetric(horizontal: 90, vertical: 20),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.white), // Example: Set text color to white
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => signup()));
                        },
                        child: Text(
                          "Signup",
                          style: TextStyle(color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold), // Example: Set button text color and style
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
