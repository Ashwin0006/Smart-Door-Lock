import 'package:flutter/material.dart';
import 'login.dart'; // Assuming login.dart is in the same directory or package
// import 'package:cloud_firestore/cloud_firestore.dart';
class signup extends StatelessWidget {
  signup({Key? key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  void _signupVerified(BuildContext context) {

      // String name = _nameController.text.trim();
      // String email = _emailController.text.trim();
      // String password = _passwordController.text.trim();
      //
      // // Add your Firebase Firestore collection reference
      // CollectionReference users = FirebaseFirestore.instance.collection('users');
      //
      // // Add the user data to Firestore
      // users.add({
      //   'name': name,
      //   'email': email,
      //   'password':password,
      //   // Add more fields as needed
      // }).then((value) {
      //   // Navigate to the login screen after successful signup
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
      // }).catchError((error) {
      //   print("Failed to add user: $error");
      //   // Handle error (show error message, retry, etc.)
      // });


    Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
  }

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
              padding: const EdgeInsets.fromLTRB(13, 1, 13, 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 200),
                  Text(
                    "Signup",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white), // Example: Set text color to white
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty || value.length < 5) {
                              return "Name must be more than 5 characters";
                            }
                            return null;
                          },
                          controller: _nameController,
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
                            hintText: "Enter Name",
                            hintStyle: TextStyle(color: Colors.white60), // Example: Set hint text color to white with opacity
                            prefixIcon: Icon(Icons.person, color: Colors.white), // Example: Set prefix icon color to white
                          ),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty || !value.contains("@")) {
                              return "Enter a valid email";
                            }
                            return null;
                          },
                          controller: _emailController,
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
                            hintText: "Enter Email",
                            hintStyle: TextStyle(color: Colors.white60), // Example: Set hint text color to white with opacity
                            prefixIcon: Icon(Icons.email, color: Colors.white), // Example: Set prefix icon color to white
                          ),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty || value.length < 5) {
                              return "Password must be more than 5 characters";
                            }
                            return null;
                          },
                          controller: _passwordController,
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
                      if (Form.of(context)!.validate()) {
                        _signupVerified(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent.withOpacity(0.8), // Example: Set button background color with opacity
                      padding: EdgeInsets.symmetric(horizontal: 90, vertical: 20),
                    ),
                    child: Text(
                      "Signup",
                      style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(color: Colors.white), // Example: Set text color to white
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => login())); // Navigate back to previous screen (login)
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold),
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
