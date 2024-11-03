import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  int currentIndex = 0;
  String result = '';
  double height = 0.0;
  double weight = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: Colors.black.withOpacity(0.06),
        actions: [
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Setting button tap'),backgroundColor: Colors.purple,));
              },
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  radioButton('Man', Colors.deepPurple, 0),
                  radioButton('Woman', Colors.teal, 1),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Your Height in Cm : ',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: "Your height in Cm",
                    filled: true,
                    fillColor: Colors.grey
                        .shade200, // when click textfield show this color
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none)),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Your Weight in Kg : ',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: "Your Weight in Kg",
                    filled: true,
                    fillColor: Colors.grey
                        .shade200, // when click textfield show this color
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none)),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyanAccent),
                      onPressed: () {
                        height = double.parse(heightController.text);
                        weight = double.parse(weightController.text);
                        calculateBmi(height, weight);
                        heightController.clear();
                        weightController.clear();
                      },
                      child: const Text(
                        'Calculate',
                        style: TextStyle(color: Colors.black),
                      ))),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  'Your BMI is : ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  result,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculateBmi(double height, double weight) {
    double res = (weight /
        (height *
            height /
            10000)); // covert cm to meter otherwise get 0.0 result
    String bmi = res.toStringAsFixed(2); // very useful
    setState(() {
      result = bmi;
    });
  }

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
        child: Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor:
                  currentIndex == index ? color : Colors.grey.shade200,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          onPressed: () {
            changeIndex(index);
          },
          child: Text(
            value,
            style: TextStyle(
                color: currentIndex == index ? Colors.white : color,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          )),
    ));
  }
}
