import 'package:flutter/material.dart';

class MyCircleIconButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback? onPressed;

  const MyCircleIconButton({
    Key? key,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey[300],
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          iconData,
          color: Colors.black,
        ),
      ),
    );
  }
}
