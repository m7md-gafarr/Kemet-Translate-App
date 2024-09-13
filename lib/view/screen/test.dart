import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kemet_translate/constant/string.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Graph Example'),
        backgroundColor: Colors.grey[900],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () async {
              Response response = await Dio().post(
                "$ApiKey/translate",
                data: {
                  'text': "محمد صببحى صابر",
                },
              );

              print(response.data);
            },
            child: const Text("data"),
          ),
        ),
      ),
    );
  }
}
