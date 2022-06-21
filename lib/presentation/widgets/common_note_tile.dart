import 'dart:math';

import 'package:flutter/material.dart';

class CommonNoteTile extends StatelessWidget {
  final String noteTitle;
  const CommonNoteTile({
    Key? key,
    required this.noteTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 110, maxHeight: 157),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors
              .primaries[Random().nextInt(Colors.primaries.length)].shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.fromLTRB(25, 0, 25, 25),
        padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 30),
        child: Text(
          noteTitle.trim(),
          textAlign: TextAlign.left,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}
