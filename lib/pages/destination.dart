import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/widget/calendar.dart';
class Destination extends StatefulWidget {
  @override
  _DestinationState createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {
  List selectLists = [];
  String type = "loop";
  void _onSelectDay(selectDay) {
    setState(() {
      selectLists = selectDay;
    });
    print(selectDay);
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.keyboard_backspace, color: Color(0xff000000), size: 24,),
            onPressed: null
        ),
        centerTitle: true,
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Color(0xffffffff),
        title: Text('选择日期范围', style: TextStyle(color: Color(0xff4a4a4a), fontSize: 16, fontWeight: FontWeight.bold),),
        actions: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Center(
              child: Container(
                width: 50,
                height: 26,
                margin: EdgeInsets.only(right: 10),
                alignment: AlignmentDirectional.center,
                decoration: (type == 'freedom' && selectLists.length > 0) || (type == 'loop' && selectLists.length == 2)?
                BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color(0xfffed846)
                ) : BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xfff6f6f6)
                ),
                child: Text('确定', textAlign: TextAlign.center, style: TextStyle(fontSize: 12,color: selectLists.length > 0 ? Color(0xff4a4a4a) : Color(0xffd3d3d3)),),
              )
            ),
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            type == 'loop' ?
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffffff)
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      width: 0.5,
                                      color: Color(0xffe6e6e6)
                                  )
                              )
                          ),
                          child: Text(selectLists.length >= 1 ? '起始日期（${selectLists[0].year}-${selectLists[0].month}-${selectLists[0].day}）' : '起始日期', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: selectLists.length != 1 ? Color(0xffe6e6e6) : Color(0xff4a4a4a)),),
                        ),
                        selectLists.length == 1 ? Container(
                          margin: EdgeInsets.only(top: 10),
                          width: 23,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Color(0xfffed846)
                          ),
                        ) : Container()

                      ],
                    ),

                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(selectLists.length == 2 ? '结束日期（${selectLists[1].year}-${selectLists[1].month}-${selectLists[1].day}）' : '结束日期',textAlign: TextAlign.center, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: selectLists.length == 2 ? Color(0xff4a4a4a) : Color(0xffe6e6e6)),),
                        ),
                        selectLists.length == 2 ? Container(
                          margin: EdgeInsets.only(top: 10),
                          width: 23,
                          height: 3,
                          decoration: BoxDecoration(
                              color: Color(0xfffed846)
                          ),
                        ) : Container()
                      ],
                    ),
                  )

                ],
              ),
            )
            : Container(),
            Expanded(
              flex:1,
              child: Container(
                width: double.infinity,
                child: Calendar(
                  type: type,
                  callback: (selectDay) => _onSelectDay(selectDay),
                ),
              ),
            ),
          ],
        )

      ),
    );
  }
}