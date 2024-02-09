import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget(
      {super.key,
      required this.icon,
      required this.obscureText,
      required this.textType});

  final IconData icon;
  final bool obscureText;
  final TextInputType textType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 270,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 4, 0),
            child: Icon(icon),
          ),
          const SizedBox(
            height: 28,
            child: VerticalDivider(
              thickness: 2,
              color: Colors.black26,
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 33,
              child: TextField(
                keyboardType: textType,
                obscureText: obscureText,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
