import 'package:flutter/material.dart';

class FieldWidget extends StatelessWidget {
  const FieldWidget({
    Key? key,
    required this.controller,
    required this.lable,
  }) : super(key: key);

  final TextEditingController controller;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: 100,
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: lable,
            border: const OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
