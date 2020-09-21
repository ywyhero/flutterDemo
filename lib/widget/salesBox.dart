import 'package:flutter/material.dart';
import 'package:myapp/model/salesBoxModel.dart';
class SalesBox extends StatelessWidget {
  final SalesBoxModel salesBoxList;
  const SalesBox({Key key, @required this.salesBoxList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _items(context),
    );
  }
  _items(BuildContext context){
    if(salesBoxList == null) return null;
    List<Widget> items = [];
    items.add(_doubleItem(context, salesBoxList.bigCard1, salesBoxList.bigCard2, true));
    items.add(_doubleItem(context, salesBoxList.smallCard1, salesBoxList.smallCard2, false));
    items.add(_doubleItem(context, salesBoxList.smallCard3, salesBoxList.smallCard4, false));
    return Column(
      children: <Widget>[
        Container(
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.white
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.network(salesBoxList.icon, width: 79, height: 15),
              GestureDetector(
                onTap: () => {},
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Color(0xffff4e63), Color(0xffff6cc9)]),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('获取更多福利 >', style: TextStyle(fontSize: 12, color: Colors.white),),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 4),
        ),
        items[0],
        Padding(
          padding: EdgeInsets.only(top: 4),
        ),
        items[1],
        Padding(
          padding: EdgeInsets.only(top: 4),
        ),
        items[2],
      ],
    );
  }
  Widget _doubleItem(BuildContext context, leftCard, rightCard, bool big){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _item(context, leftCard, big, true),
        _item(context, rightCard, big, false),
      ],
    );
  }
  _item(BuildContext context, element, bool big, bool left) {
    return Expanded(
        child: GestureDetector(
          onTap: () => {},
          child: Container(
            height: big ? 130 : 82,
            margin: left ? EdgeInsets.only(right: 4) : EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Image.network(element.icon, fit: BoxFit.fill,)
          ),
        )
    );
  }
}
