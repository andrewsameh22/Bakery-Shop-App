import 'package:flutter/material.dart';

class defIconButton extends StatelessWidget {
  Color color;
  Icon icon;
  Function onpressed;
  defIconButton({
    Key? key,
    required this.color,
    required this.icon,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color, width: 2),
        ),
        child: icon,
      ),
      onPressed: onpressed(),
    );
  }
}
