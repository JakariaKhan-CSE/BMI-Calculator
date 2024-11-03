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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI Calculator',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0.0,
          backgroundColor: Colors.black.withOpacity(0.06),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12),
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
                SizedBox(height: 20,),

                Text('Your Height in Cm : ',style: TextStyle(fontSize: 18),),
                SizedBox(height: 8,),
                TextField(
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Your height in Cm",
                    filled: true,
                    fillColor: Colors.grey.shade200, // when click textfield show this color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none
                    )
                  ),
                ),
                SizedBox(height: 20,),

                Text('Your Weight in Kg : ',style: TextStyle(fontSize: 18),),
                SizedBox(height: 8,),
                TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "Your Weight in Kg",
                      filled: true,
                      fillColor: Colors.grey.shade200, // when click textfield show this color
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none
                      )
                  ),
                ),

                SizedBox(height: 20,),
                
                Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyanAccent
                        ),
                        onPressed: (){}, child: Text('Calculate',style: TextStyle(color: Colors.black),))),

                SizedBox(height: 20,),

                Container(
                  width: double.infinity,
                  child: Text('Your BMI is : ',textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),),
                ),

                SizedBox(height: 50,),
                Container(
                  width: double.infinity,
                  child: Text('',textAlign: TextAlign.center,style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                  ),),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  String calculateBmi(double height, double weight){
    double result = weight / (height*height);
    String bmi = result.toStringAsFixed(2); // very useful
    return bmi;
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
      margin: EdgeInsets.symmetric(horizontal: 12),
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
            style:
                TextStyle(color: currentIndex == index ? Colors.white : color,
                fontSize: 18,fontWeight: FontWeight.bold),
          )),
    ));
  }
}
