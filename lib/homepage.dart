import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // create TimeOfDay variable
  TimeOfDay _timeOfDay = TimeOfDay.now();

  // show time picker method
  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade200,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade300,
        title: Text("Time Picker"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // display the chosen time
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x29000000),
                        offset: Offset(0, 2),
                        blurRadius: 12,
                        spreadRadius: 1)
                  ],
                  color: Color(0xff80cbc4)),
              child: Text(
                _timeOfDay.format(context).toString(),
                style: TextStyle(fontSize: 50),
              ),
            ),

            // button
            MaterialButton(

              onPressed: _showTimePicker,
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('PICK TIME',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
              color: Colors.teal.shade500,
            ),
          ],
        ),
      ),
    );
  }
}
