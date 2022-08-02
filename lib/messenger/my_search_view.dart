import 'package:flutter/material.dart';

class MySearchView extends StatelessWidget {
  ValueChanged<String>? onFieldSubmitted;

  MySearchView({
    Key? key,
    required this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        textInputAction: TextInputAction.search,
        decoration: const InputDecoration(
            hintText: "Search",
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none),
      ),
    );
  }
}
