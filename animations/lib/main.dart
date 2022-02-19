// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'src/basics/01_animated_container.dart';

void main() => runApp(const AnimationSamples());

class Demo {
  final String name;
  final String route;
  // widget 생성
  // ex StatelessWidget.build or State.build
  final WidgetBuilder builder;

  // Demo 인스턴스 생성자
  // required 는 인스턴스 생성 시 필수로 입력해야하는 인자값에 지정
  const Demo({
    required this.name,
    required this.route,
    required this.builder,
  });
}

final basicDemos = [
  Demo(
      name: 'AnimatedContainer',
      route: AnimatedContainerDemo.routeName,
      builder: (context) => const AnimatedContainerDemo()),
];

// Map<K, V>class
// Map.fromEntries = Map 을 만들고 모든 MapEntry 를 추가한다.
final basicDemoRoutes =
Map.fromEntries(basicDemos.map((d) => MapEntry(d.route, d.builder)));

// routes 정의
// MaterialApp 생성자에는 routes 를 정의할 수 있음
// Map<String, WidgetBuilder> -> route + name 에서 경로를 만들어 builder 함수로 매핑
// 해당 맵을 사용하여 onGenerateRoute callback 생
final allRoutes = <String, WidgetBuilder>{
  ...basicDemoRoutes,
};

// StatelessWidget -> 상태가 없는 widget
// 변경 가능한 상태가 필요하지 않음
// 이벤트, 사용자 액션에 상관없이 위젯이 로드될 때 한번만 렌더링 됨
class AnimationSamples extends StatelessWidget {
  const AnimationSamples({Key? key}) : super(key: key);

  // MaterialApp
  // Flutter App UI 기본 구조를 잡아주는 App Widget
  // 앱 이름, 테마, 다국어 지원 등 앱 설정 관리
  // home 속성에 Start UI 지정
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Samples',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routes: allRoutes,
      // 앱의 기본 경로인 Navigator.defaultRouteName 에 대한 위젯
      // initialRoute 가 지정되지 않은 경우 먼저 표시되는 경로
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // Scaffold
  // Material Design 의 기본 구조가 되는 위젯
  // Appbar, 중앙 스크린, bottom navigation 구조가 미리 정의된 위젯
  @override
  Widget build(BuildContext context) {
    final headerStyle = Theme.of(context).textTheme.headline6;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Samples'),
      ),
      body: ListView(
        children: [
          ListTile(title: Text('Basics', style: headerStyle)),
          ...basicDemos.map((d) => DemoTile(demo: d)),
        ],
      ),
    );
  }
}

class DemoTile extends StatelessWidget {
  final Demo demo;

  const DemoTile({required this.demo, Key? key}) : super(key: key);

  // ListTile
  // 아이콘, 체크박스 등과 같은 다른 위젯과 함께 선택적으로 1 ~ 3줄의 텍스트 포함
  // 일반적으로 ListView, Drawers, Cards Columns 에 정렬 됨
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(demo.name),
      onTap: () {
        Navigator.pushNamed(context, demo.route);
      },
    );
  }
}