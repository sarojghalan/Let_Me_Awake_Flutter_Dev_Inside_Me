import 'package:flutter/material.dart';

class SectionFormField extends StatelessWidget {
  final String label;
  final String helperText;
  const SectionFormField(
      {required this.label, required this.helperText, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
                color: Colors.purple,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          TextField(
            decoration: InputDecoration(
                // prefixIcon: const Icon(Icons.lock,size: 18,color: Colors.purple,),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.4)),
                hintText: helperText,
                hintStyle:
                    const TextStyle(color: Colors.black38, fontSize: 14)),
          )
        ],
      ),
    );
  }
}