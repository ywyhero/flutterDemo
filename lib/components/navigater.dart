import 'package:flutter/material.dart';
import './../pages/index.dart';
import './../pages/my.dart';
import './../pages/destination.dart';
import './../pages/travel.dart';
class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Color(0xff8a8a8a); // 默认颜色
  final _activeColor = Color(0xff50b4ed); // 选中颜色
  final PageController _controller = PageController(
    initialPage: 0
  );
  int _currentIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          Index(), // 首页
          Destination(), // 目的地页面
          Travel(), // 旅拍页面
          My(), // 我的页面
        ],
        physics: NeverScrollableScrollPhysics(), // 禁止滚动
        
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            _controller.jumpToPage(index); // 跳转对应页面
            setState(() {
              _currentIndex = index;             
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('images/xiecheng.png', width: 22, height: 22),
              activeIcon: Image.asset('images/xiecheng_active.png', width: 22, height: 22),
              title: Text(
                '首页',
                style: TextStyle(
                  color: _currentIndex != 0 ? _defaultColor : _activeColor
                )
              )
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/mude.png', width: 24, height: 24),
              activeIcon: Image.asset('images/mude_active.png', width: 24, height: 24),
              title: Text(
                '目的地',
                style: TextStyle(
                  color: _currentIndex != 1 ? _defaultColor : _activeColor
                )
              )
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/lvpai.png', width: 23, height: 23),
              activeIcon: Image.asset('images/lvpai_active.png', width: 23, height: 23),
              title: Text(
                '旅拍',
                style: TextStyle(
                  color: _currentIndex != 2 ? _defaultColor : _activeColor
                )
              )
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/wode.png', width: 23, height: 23),
              activeIcon: Image.asset('images/wode_active.png', width: 23, height: 23),
              title: Text(
                '我的',
                style: TextStyle(
                  color: _currentIndex != 3 ? _defaultColor : _activeColor
                )
              )
            )
          ],
      )
    );
  } 
}