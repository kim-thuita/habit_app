import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class image_containers extends StatelessWidget {
  final FaIcon icon;
  final Function()? onTap;

  const image_containers({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        width: 150,
        height: 115,
        child: icon,
      ),
    );
  }
}
