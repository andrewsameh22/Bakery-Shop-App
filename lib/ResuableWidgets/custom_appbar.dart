import 'package:flutter/material.dart';

import '../styles/colours.dart';

class CustomAppbar extends StatelessWidget {
  final String title;

  const CustomAppbar({Key? key, this.title = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      title: Text(title),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: primaryColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
