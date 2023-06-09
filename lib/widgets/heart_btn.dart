import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../services/utils.dart';

class HeartBTN extends StatelessWidget {
  const HeartBTN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;

    return GestureDetector(
      onTap: () {
        print('print heart buttons is pressed');
      },
      child: Icon(
        IconlyLight.heart,
        size: 21,
        color: color,
      ),
    );
  }
}
