import "package:digtal_lock/lockd.dart";
import "package:digtal_lock/login.dart";
import "package:flutter/material.dart";

class lockhome extends StatelessWidget {
  const lockhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white70,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: 80),
              Text(
                'We are here to make your life easier!',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Easily manage your locks in real time.Take care of all your devices in one place.",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 50,
              ),
              Icon(Icons.lock_outline, size: 250, color: Colors.black),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => login()));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Start now',
                      style: TextStyle(fontSize: 21, color: Colors.white),
                    ),
                    Icon(
                      Icons.arrow_right_alt,
                      color: Colors.white,
                      size: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
