import 'package:flutter/material.dart';

class NumberStepper extends StatefulWidget {
  final String label;
  final int min;
  final int max;
  final int initialValue;
  final ValueChanged<int> onChanged;

  const NumberStepper({
    Key? key,
    required this.label,
    required this.min,
    required this.max,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<NumberStepper> createState() => _NumberStepperState();
}

class _NumberStepperState extends State<NumberStepper> {
  late int value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue.clamp(widget.min, widget.max);
  }

  void _increase() {
    if (value < widget.max) {
      setState(() => value++);
      widget.onChanged(value);
    }
  }

  void _decrease() {
    if (value > widget.min) {
      setState(() => value--);
      widget.onChanged(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
          color: Color(0xFFF0F5F5),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.label),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: _decrease,
                ),
                Text(
                  value.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: _increase,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
