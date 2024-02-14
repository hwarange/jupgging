import 'package:flutter/material.dart';
import 'package:gdsc/commmon/const/colors.dart';

class RankCard extends StatelessWidget {
  final Widget ? child;



  const RankCard({

    this.child,

    Key ? key
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      width: 330,
      height: 30,
      decoration: ShapeDecoration(
          shadows: [BoxShadow(
            color: Color(0xff91B194),
            offset: Offset(0,2),
            blurRadius:7,
          )],
          color: W_BOX_COLOR,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24)
          )
      ),
      child: child
    );
  }
}
