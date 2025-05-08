import 'package:dar_water_derivery_system/Create_account.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  if (kIsWeb) {
    // Initialize Firebase for Web
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAFW92cFSHvZriJA2M6rta1MVtZEocBGWg",
        authDomain: "dar-water-delivery-syste-cfcb6.firebaseapp.com",
        projectId: "dar-water-delivery-syste-cfcb6",
        storageBucket: "dar-water-delivery-syste-cfcb6.appspot.com",
        messagingSenderId: "540697026906",
        appId: "1:540697026906:web:ec184f6ba75c997473d363",
        measurementId: "G-Y43ETMZ69L",
      ),
    );
  } else {
    // Initialize Firebase for Android/iOS
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water Delivery System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignUpScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DAR WATER REQUEST'), // AppBar Title
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 1, // Set radius to a visible size
              backgroundImage: AssetImage('assets/images/2.jpeg'), // Updated image path
            ),
          ),
        ],
      ),
      body: Center(  // Center everything in the body
        child: Container(
          color: const Color.fromARGB(255, 59, 32, 211),
          width: double.infinity, // Make the container fill the screen width
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, // Center items horizontally
            children: [
              // Method 1: Using CircleAvatar
              CircleAvatar(
                radius: 50,  // You can adjust this value to change the size
                backgroundImage: AssetImage('assets/images/2.jpeg'), // Updated image path
              ),
              const SizedBox(height: 20),
              
              // Method 2: Using ClipOval
              ClipOval(
                child: Image.asset(
                  'assets/images/2.jpeg', // Updated image path
                  width: 50,  // Width and height should be equal for a perfect circle
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'DAR WATER REQUEST',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20), // Space between text and button
              ElevatedButton(
                onPressed: ( ) {
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateAccount()),
                  );
                },
                
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Button background color
                  foregroundColor: Colors.blue, // Button text color
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 18), // Customize text style
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
