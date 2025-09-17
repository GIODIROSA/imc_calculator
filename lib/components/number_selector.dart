
import 'package:flutter/cupertino.dart';

class NumberSelector extends StatefulWidget {
  const NumberSelector({super.key});

  @override
  State<NumberSelector> createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Number Selector!")
      ],
    );
  }
}