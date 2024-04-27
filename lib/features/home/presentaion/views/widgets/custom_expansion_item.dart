import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class CustomExpansionItem extends StatelessWidget {
  const CustomExpansionItem({
    super.key,
    required this.title,
    required this.subject,
    required this.color, required this.onLongPress, required this.onPressed,
  });
  final String title;
  final String subject;
  final int color;
  final void Function() onLongPress;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onLongPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: ExpansionTileItem(
          leading: IconButton(onPressed: onPressed, icon: const Icon(Icons.edit)),
          iconColor: Colors.black,
          title: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: thirdColor,
          decoration: BoxDecoration(
            color: Color(color),
          ),
          children: [
            Text(
              subject,
              style: const TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
