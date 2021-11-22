import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Align(
          child: Text(
            'IBM App',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          alignment: Alignment.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Name',
                  hintText: 'Name',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: RadionBtnChecked(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Age',
                  hintText: 'Age',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Chiều Cao',
                  hintText: 'Chiều Cao (CM)',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Cân Nặng',
                  hintText: 'Cân Nặng (KG)',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum BestChecked { boy, girl }

class RadionBtnChecked extends StatefulWidget {
  const RadionBtnChecked({Key? key}) : super(key: key);

  @override
  _RadionBtnCheckedState createState() => _RadionBtnCheckedState();
}

class _RadionBtnCheckedState extends State<RadionBtnChecked> {
  // ignore: unused_field
  int _radioValue1 = -1;
  _myFunction(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 1:
          Fluttertoast.showToast(
              msg: 'Correct !', toastLength: Toast.LENGTH_SHORT);
          break;
        case 2:
          Fluttertoast.showToast(msg: 'Try again !',toastLength: Toast.LENGTH_SHORT);
          break;
        default:
      }
    });
  }
  //=> print("Being pressed!");

  // ignore: unused_element
  /*dynamic _handleRadioValueChange1() {
    int value;
    setState(() {
      int _radioValue1 = value;

      switch (_radioValue1) {
        case 1:
          Fluttertoast.showToast(
              msg: 'Correct !', toastLength: Toast.LENGTH_SHORT);
          break;
        case 2:
          Fluttertoast.showToast(
              msg: 'Try again !', toastLength: Toast.LENGTH_SHORT);
          break;
      }
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'You are :',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(
                value: 1,
                groupValue: _radioValue1,
                onChanged: _myFunction(_radioValue1)),
            const Text(
              'Boy',
              style: TextStyle(fontSize: 16),
            ),
            Radio(
                value: 2,
                groupValue: _radioValue1,
                onChanged: _myFunction(_radioValue1)),
            const Text(
              'Girl',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        const Divider(
          height: 5,
          color: Colors.black,
        ),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
      ],
    );
  }
}
