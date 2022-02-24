// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math';

import 'package:flutter/material.dart';

double generateBorderRadius() => Random().nextDouble() * 64;
double generateMargin() => Random().nextDouble() * 64;
Color generateColor() => Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));

class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({Key? key}) : super(key: key);
  static String routeName = '/basics/01_animated_container';

  // createState()
  // State 클래스의 객 생성자
  // 위젯트리의 지정된 위치에 위젯의 변경 가능한 state 를 생성
  // 필수 오버라이드
  // StatefulWidget 의 수명 동안 해당 메소드를 여러번 호출
  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  late Color color;
  late double borderRadius;
  late double margin;

  // initState()
  // State 객체가 생성되면 호출
  // 위젯이 최초로 생성되는 상황에서 호출
  // 1번만 호출됨
  @override
  void initState() {
    super.initState();
    color = Colors.deepPurple;
    borderRadius = generateBorderRadius();
    margin = generateMargin();
  }

  // setState()
  // State 객체의 상태가 변경되었음을 프레임워크에 알림
  // 프레임워크가 변경을 감지하고 build() 호출 준비
  void change() {
    setState(() {
      color = generateColor();
      borderRadius = generateBorderRadius();
      margin = generateMargin();
    });
  }

  @override
  Widget build(BuildContext context) {
    // This widget is built using an AnimatedContainer, one of the easiest to use
    // animated Widgets. Whenever the AnimatedContainer's properties, such as decoration,
    // change, it will handle animating from the previous value to the new value. You can
    // specify both a Duration and a Curve for the animation.
    // This Widget is useful for designing animated interfaces that just need to change
    // the properties of a container. For example, you could use this to design expanding
    // and shrinking cards.
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 128,
                height: 128,
                child: AnimatedContainer(
                  margin: EdgeInsets.all(margin),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  duration: const Duration(milliseconds: 100),
                ),
              ),
            ),
            ElevatedButton(
              child: const Text(
                'change',
              ),
              onPressed: () => change(),
            ),
          ],
        ),
      ),
    );
  }
}
