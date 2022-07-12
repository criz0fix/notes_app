import 'package:flutter/material.dart';

import 'package:notes_app/config/themes/app_color.dart';

class DeleteBackGround extends StatelessWidget {
  const DeleteBackGround({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(25, 0, 25, 25),
      padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 30),
      alignment: Alignment.center,
      color: AppColor.red,
      child: Row(
        children: const [
          Icon(
            Icons.delete,
            color: Colors.white,
          ),
          Spacer(),
          Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
