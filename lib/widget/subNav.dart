import 'package:flutter/material.dart';
import 'package:myapp/model/commonModel.dart';
class SubNav extends StatelessWidget {
  final List<CommonModel> subNavList;
  const SubNav({Key key, @required this.subNavList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6))
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: _items(context),
      ),
    );
  }
  _items(BuildContext context) {
    if(subNavList == null) return null;
    List<Widget> items = [];
    subNavList.forEach((element) {
      items.add(_item(context, element));
    });
    int separate = (subNavList.length / 2 + 0.5) .toInt();
    print(separate);
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.sublist(0, separate),
        ),
        Padding(padding: EdgeInsets.only(top: 10),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.sublist(separate, subNavList.length),
        )
      ],
    );
  }
  _item(BuildContext context, element) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () => {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(element.icon, width: 28, height: 28,),
            Text(element.title, style: TextStyle(fontSize: 12),)
          ],
        ),
      ),
    );
  }
}