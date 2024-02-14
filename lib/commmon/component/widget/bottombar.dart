import'package:flutter/material.dart';

import '../../const/colors.dart';

class BottomBar extends StatelessWidget {
  final GestureTapCallback? onTap;

  const BottomBar({
    this.onTap,
    Key ? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: BODY_TEXT_COLOR,
      unselectedItemColor: Colors.black,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      type: BottomNavigationBarType.shifting,
      onTap: (int index) {
        onTap;
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '장바구니'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '설정'
        ),

      ],
    );
  }
}
