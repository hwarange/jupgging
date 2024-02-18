import 'dart:async';
import 'package:flutter/material.dart';

import '../commmon/const/colors.dart';
import '../home/component/home_card.dart';

enum IconState {
  start,
  pause,
}

class RunningBox extends StatefulWidget {
  @override
  _RunningBoxState createState() => _RunningBoxState();
}

class _RunningBoxState extends State<RunningBox> {
  late Timer _timer;
  double _remainingDistance = 10.0; // 예시로 10.0으로 초기화
  bool _isRunning = false;
  IconState _iconState = IconState.start; // 아이콘 상태 추가

  void _startRunning() {
    if (!_isRunning) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (_remainingDistance > 0) {
          setState(() {
            _remainingDistance -= 0.1; // 예시로 0.1씩 감소
          });
        } else {
          _timer.cancel();
        }
      });
      setState(() {
        _isRunning = true;
      });
    }
  }

  void _pauseRunning() {
    if (_isRunning) {
      _timer.cancel();
      setState(() {
        _isRunning = false;
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel(); // 타이머 취소
    super.dispose(); // 부모 클래스의 dispose 메서드 호출
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 300,
      decoration: BoxDecoration(
        color: BG_COLOR,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text("HUFS\nLv.2",
                    style: TextStyle(
                        color: W_BOX_COLOR,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(color: W_BOX_COLOR, width: 3),
                          right: BorderSide(color: W_BOX_COLOR ,width: 3)
                      )
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text("플러깅 하러가기",
                    style: TextStyle(
                        color: W_BOX_COLOR,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,),
                ),
                ElevatedButton(
                    onPressed: (){
                      if (_iconState == IconState.start) {
                        _startRunning();
                        setState(() {
                          _iconState = IconState.pause;
                        });
                      } else {
                        _pauseRunning();
                        setState(() {
                          _iconState = IconState.start;
                        });
                      }
                    },
                    child: _iconState == IconState.start ? Icon(Icons.play_arrow) :Icon(Icons.pause),

                )
              ],
            ),
          ),
          LinearProgressIndicator(
            value: _remainingDistance / 10.0, // 전체 거리 예시로 10.0으로 설정
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(BODY_TEXT_COLOR),

          ),
        ],
      ),
    );
  }
}
