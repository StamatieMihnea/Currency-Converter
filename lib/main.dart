import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const imageUrl =
      'https://ekronomica.ro/wp-content/uploads/2018/10/bani.jpeg';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: const Text(
              "Currency convertor",
            ),
          ),
        ),
        body: Wrap(
          children: <Widget>[
            Image.network(imageUrl),
            ConvertorForm(),
          ],
        ),
      ),
    );
  }
}

class ConvertorForm extends StatefulWidget {
  const ConvertorForm({Key? key}) : super(key: key);

  @override
  State<ConvertorForm> createState() => _ConvertorFormState();
}

class _ConvertorFormState extends State<ConvertorForm> {
  static const hintText = 'enter the amount in EUR';
  static const buttonText = 'CONVERT!';
  static const convertRate = 4.93;
  final TextEditingController fieldController = TextEditingController();
  String? errorText = null;
  String convertedValue = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            controller: fieldController,
            keyboardType: TextInputType.numberWithOptions(
              decimal: true,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              errorText: errorText,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            double? number = 0;
            number = double.tryParse(fieldController.value.text);
            setState(() {
              if (number == null) {
                errorText = 'Please enter a number';
                convertedValue = '';
              } else {
                errorText = null;
                convertedValue =
                    '${(number * convertRate).toStringAsFixed(2)} RON';
              }
            });
          },
          child: Text(buttonText),
        ),
        if (convertedValue.length != 0)
          Text(
            convertedValue,
            style: TextStyle(
              fontSize: 30,
            ),
          )
      ],
    );
  }
}
