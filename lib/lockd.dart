import "package:digtal_lock/lockhome.dart";
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

class LockScreen extends StatefulWidget {
  @override
  _LockScreenState createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  bool isLocked = true;
  final String esp32Ip = "http://192.168.70.125";

  Future<void> toggleLock() async {
    setState(() {
      isLocked = true;
    });
    final response = await http.get(Uri.parse('$esp32Ip/on'));
    if (response.statusCode == 200) {
      print('DOOR LOCKED!');
    } else {
      print('Failed to Lock Door!');
    }
  }

  Future<void> _toggleunLock() async {
    setState(() {
      isLocked = false;
    });
    final response = await http.get(Uri.parse('$esp32Ip/off'));
    if (response.statusCode == 200) {
      print("DOOR UNLOCKED!");
    } else {
      print("Unable to Unlock Door!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("image/img2.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            // color: Colors.white.withOpacity(0.3), // Adjust opacity here
            padding: EdgeInsets.fromLTRB(0, 65, 0, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu, size: 30, color: Colors.white),
                    Text(
                      'Door Lock',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.lightBlueAccent,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 140),
                Icon(
                  isLocked ? Icons.lock_outline : Icons.lock_open,
                  size: 150,
                  color: Colors.white,
                ),
                const SizedBox(height: 20),
                Text(
                  isLocked ? 'The door is closed' : 'The door is opened',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  'Click the button to ${isLocked ? 'open it' : 'close it'}',
                  style: const TextStyle(fontSize: 18, color: Colors.white70),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => lockhome()));
                      },
                      backgroundColor: Colors.lightBlueAccent,
                      child: const Icon(
                        Icons.home,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: _toggleunLock,
                      backgroundColor: Colors.lightBlueAccent,
                      child: const Icon(
                        Icons.lock_open,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: toggleLock,
                      backgroundColor: Colors.lightBlueAccent,
                      child: Icon(
                        isLocked ? Icons.lock_outline : Icons.lock_open,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
