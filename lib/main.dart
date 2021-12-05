import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IbmApp(),
    );
  }
}

class IbmApp extends StatefulWidget {
  const IbmApp({Key? key}) : super(key: key);

  @override
  _IbmAppState createState() => _IbmAppState();
}

class _IbmAppState extends State<IbmApp> {
  //custom radio Button
  int currentindex = 0;
  String result = "";

  //custom inputCtroller
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        //first, create Appbar
        appBar: AppBar(
          title: Text(
            "BMI Caculator",
            style: TextStyle(color: Colors.white),
          ),
          elevation: 0.0,
          backgroundColor: Colors.blueAccent,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            )
          ],
        ),
        //create body
        //warp inside a SingleScrollChild
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    radioButton("Man", Colors.lightBlue, 0),
                    radioButton("Woman", Colors.pink, 1),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                //create input form
                Text(
                  "Your Height in CM: ",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(
                  height: 8.0,
                ),

                TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  //custom Controller
                  controller: heightController,
                  decoration: InputDecoration(
                    hintText: "Your height in Cm",
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                SizedBox(
                  height: 8.0,
                ),

                //create countinue
                Text(
                  "Your Weight in KG: ",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(
                  height: 8.0,
                ),

                TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  controller: weightController,
                  decoration: InputDecoration(
                    hintText: "Your weight in kg",
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                SizedBox(
                  height: 20.0,
                ),

                //create button
                Container(
                  // ignore: deprecated_member_use
                  width: double.infinity,
                  height: 40.0,
                  child: FlatButton(
                    onPressed: () {
                      double height = double.parse(heightController.value.text);
                      double weight = double.parse(weightController.value.text);
                      caculateBMI(height, weight);
                    },
                    color: Colors.blueAccent,
                    child: Text(
                      "Caculate",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20.0,
                ),

                Container(
                  width: double.infinity,
                  child: Text(
                    "Your BMI is: ",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),

                SizedBox(
                  height: 50.0,
                ),

                Container(
                  width: double.infinity,
                  child: Text(
                    "$result",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void caculateBMI(double height, double weight) {
    double finalresult = weight / (height * height / 10000);
    String bmi = finalresult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  //declare funtion
  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  //create a new custom widgets
  Widget radioButton(String value, Color color, int index) {
    return Expanded(
        child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      //up height
      height: 80.0,
      // ignore: deprecated_member_use
      child: FlatButton(
        //this line means if the current index is equalt to the button index then put the color
        //the main color the we will define otherwise make it grey
        color: currentindex == index ? color : Colors.grey.shade200,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        onPressed: () {
          changeIndex(index);
        },
        //apply some modification to the button text color
        child: Text(
          value,
          style: TextStyle(
            color: currentindex == index ? Colors.white : color,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ));
  }
}
