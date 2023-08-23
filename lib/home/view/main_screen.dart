import 'package:flutter/material.dart';

import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double total = 0.0;
  int numberOfPeople = 0;
  TextEditingController totalController = TextEditingController();
  TextEditingController numberOfPeopleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 150.0),
              const Text(
                "Split-It",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: totalController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Total Amount',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: numberOfPeopleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Number of People',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20.0),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreen(
                                peopleCount:
                                    int.parse(numberOfPeopleController.text),
                                totalAmount: double.parse(totalController.text),
                              )));
                },
                color: Colors.blue,
                child: const Text(
                  'Calculate',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
