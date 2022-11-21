import 'package:flutter/material.dart';

const String hintText = 'enter the amount in EUR';
const String buttonText = 'CONVERT!';
const double convertRate = 4.93;
const String imageUrl = 'https://ekronomica.ro/wp-content/uploads/2018/10/bani.jpeg';

void main() {
  runApp(const ConvertorApp());
}

class ConvertorApp extends StatelessWidget {
  const ConvertorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Currency convertor',
            ),
          ),
        ),
        body: Wrap(
          children: <Widget>[
            Image.network(imageUrl),
            const ConvertorForm(),
          ],
        ),
      ),
    );
  }
}

class ConvertorForm extends StatefulWidget {
  const ConvertorForm({super.key});

  @override
  State<ConvertorForm> createState() => _ConvertorFormState();
}

class _ConvertorFormState extends State<ConvertorForm> {
  final TextEditingController fieldController = TextEditingController();
  String? errorText;
  String convertedValue = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: fieldController,
            keyboardType: const TextInputType.numberWithOptions(
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
            double? number;
            number = double.tryParse(fieldController.value.text);
            setState(() {
              if (number == null) {
                errorText = 'Please enter a number';
                convertedValue = '';
              } else {
                errorText = null;
                convertedValue = '${(number * convertRate).toStringAsFixed(2)} RON';
              }
            });
          },
          child: const Text(buttonText),
        ),
        if (convertedValue.isNotEmpty)
          Text(
            convertedValue,
            style: const TextStyle(
              fontSize: 30,
            ),
          )
      ],
    );
  }
}
