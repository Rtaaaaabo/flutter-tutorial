import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer();

  @override
  _Footer createState() => _Footer();
}

class _Footer extends State<Footer> {
  int _selectedIndex = 0;
  var _bottomNavigationBarItems = List<BottomNavigationBarItem>();

  // アイコン情報
  static const _footerIcons = [
    Icons.home,
    Icons.textsms,
    Icons.access_time,
    Icons.content_paste,
    Icons.work,
  ];

  // アイコンの文字列
  static const _footerItemNames = [
    'ホーム',
    'トーク',
    'タイムライン',
    'ニュース',
    'ウォレット',
  ];

  // インデックスのアイテムをアクティベートする
  BottomNavigationBarItem updateActiveState(int index) {
    return BottomNavigationBarItem(
        icon: Icon(
          _footerIcons[index],
          color: Colors.black87,
        ),
        title: Text(
          _footerItemNames[index],
          style: TextStyle(
            color: Colors.black87,
          ),
        ));
  }

  // インデックスのアイテムをディアクティブベートする
  BottomNavigationBarItem updateDeactiveState(int index) {
    return BottomNavigationBarItem(
        icon: Icon(
          _footerIcons[index],
          color: Colors.black26,
        ),
        title: Text(
          _footerItemNames[index],
          style: TextStyle(
            color: Colors.black26,
          ),
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _bottomNavigationBarItems[_selectedIndex] =
          updateDeactiveState(_selectedIndex);
      _bottomNavigationBarItems[index] = updateActiveState(index);
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _bottomNavigationBarItems.add(updateActiveState(0));
    for (var i = 1; i < _footerItemNames.length; i++) {
      _bottomNavigationBarItems.add(updateDeactiveState(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: _bottomNavigationBarItems,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
