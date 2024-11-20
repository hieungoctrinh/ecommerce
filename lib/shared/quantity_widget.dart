import 'package:flutter/material.dart';
import 'package:food_app/constant.dart';

class QuantityScreen extends StatefulWidget {
  const QuantityScreen({
    super.key,
    required this.initValue,
    required this.callback,
  });

  final int initValue;
  final Function(int) callback;

  @override
  State<QuantityScreen> createState() => _QuantityScreenState();
}

class _QuantityScreenState extends State<QuantityScreen> {
  late int current; // Lưu trữ giá trị của current trong state

  @override
  void initState() {
    super.initState();
    current = widget.initValue; // Khởi tạo giá trị từ initValue
  }

  @override
  Widget build(BuildContext context) {
    // var current = widget.initValue;
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: kcontentColor,
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {
              setState(() {
                current++;
                widget.callback(current);
              });
            },
            icon: const Icon(
              Icons.add,
              color: Colors.red,
              size: 25,
            ),
          ),
          Text(
            current.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w800),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                if (current > 1) {
                  current--;
                  widget.callback(current);
                }
              });
            },
            icon: const Icon(
              Icons.remove,
              color: Colors.red,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
