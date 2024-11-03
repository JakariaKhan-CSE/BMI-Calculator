import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator',style: TextStyle(
        color: Colors.black
      ),),
        elevation: 0.0,
        backgroundColor: Colors.black.withOpacity(0.06),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.settings, color: Colors.black,))
        ],
      ),
        body: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.all(12),
          child: Column(
            children: [

            ],
          ),
          ),
        ),
      ),
    );
  }
  void changeIndex(int index){
    setState(() {
      currentIndex = index;
    });
  }

  Widget radioButton(String value, Color color, int index ){
    return Expanded(child: Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: currentIndex == index ? color: Colors.grey.shade200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          )
        ),
          onPressed: (){
          changeIndex(index);
          }, child: Text(value,style: TextStyle(
        color: currentIndex==index ? Colors.white : color
      ),)),
    ));
  }
}
