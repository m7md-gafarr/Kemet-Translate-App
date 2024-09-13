import 'package:flutter/material.dart';
import 'package:kemet_translate/constant/string.dart';

class BodyAndAppBarWidget extends StatelessWidget {
  BodyAndAppBarWidget({super.key, required this.children, required this.text});
  List<Widget> children;
  String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SubdarkColor,
        title: Text(
          text,
          style: const TextStyle(
            fontFamily: PrimaryFont,
            color: PrimaryColor,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              SubdarkColor,
              SubColor,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            child: Column(
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
