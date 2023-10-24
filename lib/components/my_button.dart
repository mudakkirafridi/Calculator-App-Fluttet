import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onpress;

  const Mybutton(
      {super.key,
      required this.title,
      this.color = const Color.fromARGB(255, 136, 134, 134),
      required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: InkWell(
          onTap: onpress,
          child: Container(
            height: 70,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: color,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(4),
                    bottomLeft: Radius.circular(4))),
            child: Center(
                child: Text(
              title,
              style: const TextStyle(color: Colors.white),
            )),
          ),
        ),
      ),
    );
  }
}
