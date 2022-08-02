import 'package:flutter/material.dart';

class MyCircleIconButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback? onPressed;
  final Color color;

  const MyCircleIconButton({
    Key? key,
    required this.iconData,
    required this.onPressed,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey[300],
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          iconData,
          color: color
        ),
      ),
    );
  }
}
