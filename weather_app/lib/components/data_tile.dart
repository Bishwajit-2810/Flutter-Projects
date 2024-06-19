import 'package:flutter/material.dart';

class DataTile extends StatelessWidget {
  final String data1;
  final String data2;
  final IconData icon1;
  final IconData icon2;

  const DataTile(
      {super.key,
      required this.data1,
      required this.data2,
      required this.icon1,
      required this.icon2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Center(
          child: Column(
            children: [
              Icon(
                icon1,
                size: 50,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                data1,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Column(
            children: [
              Icon(
                icon2,
                size: 50,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                data2,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
