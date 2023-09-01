import 'package:flutter/material.dart';
import 'package:ostelloproject/mainscreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/logoas.png'),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Mainscreen()));
          },
          child: Container(
            height: 100,
            width: 180,
            decoration: BoxDecoration(
              color: const Color(0xFF7D23E0),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Text(
                'JEE-Mains',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20,),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
