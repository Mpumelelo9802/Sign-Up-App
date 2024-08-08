import 'package:flutter/material.dart';
import 'package:flutter_application_4/screen1.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  var isVisible = false;
  String? userSelectedradio = "";
  bool agreedConditions = false;
  DateTime userSelectedDate = DateTime.now();
  double uservalue = 0.0;
  var usernamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "images/bg13.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 203, 205, 207),
                    Colors.white,
                    Color.fromARGB(255, 135, 132, 132),
                  ],
                ),
              ),
              height: 500,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontFamily: "Times",
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: usernamecontroller,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      hintText: "Enter your name",
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          usernamecontroller.clear();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    obscureText: isVisible,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: isVisible
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                      prefixIcon: const Icon(Icons.lock),
                      hintText: "Enter your password",
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Male',
                        groupValue: userSelectedradio,
                        onChanged: (value) {
                          setState(() {
                            userSelectedradio = value;
                          });
                        },
                      ),
                      const Text('Male'),
                      Radio<String>(
                        value: 'Female',
                        groupValue: userSelectedradio,
                        onChanged: (value) {
                          setState(() {
                            userSelectedradio = value;
                          });
                        },
                      ),
                      const Text('Female'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Checkbox(
                        value: agreedConditions,
                        onChanged: (value) {
                          setState(() {
                            agreedConditions = value!;
                          });
                        },
                      ),
                      const Text("I accept the terms and conditions"),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Enter your Birthday"),
                      IconButton(
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2030),
                          ).then((value) {
                            if (value != null) {
                              setState(() {
                                userSelectedDate = value;
                              });
                            }
                          });
                        },
                        icon: const Icon(Icons.calendar_month),
                      ),
                    ],
                  ),
                  Slider(
                    min: 0.0,
                    max: 10.0,
                    divisions: 10,
                    value: uservalue,
                    onChanged: (value) {
                      setState(() {
                        uservalue = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20), // Add spacing before button
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Confirmation!!"),
                            content: const Text(
                                "Are you sure you want to sign up??"),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(
                                          username: usernamecontroller.text),
                                    ),
                                  );
                                },
                                child: const Text("YES"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black, // Button background color
                                  foregroundColor: Colors.white, // Button text color
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("NO"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text("SIGN UP"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Button background color
                      foregroundColor: Colors.white, // Button text color
                    ),
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
