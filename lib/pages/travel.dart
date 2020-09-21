import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_picker/PickerLocalizations.dart';
class Travel extends StatefulWidget {
  @override
  _TravelState createState() => _TravelState();
}

class _TravelState extends State<Travel> {
  List periods = ['1','2','3','4','5','6','7','8','9','10'];
  List times = ['15', '20', '25', '30', '35', '40', '45', '50', '55', '60', '65', '70', '75', '80', '85', '90', '95', '100'];
  String courseName = '请选择课程';
  String classPeriods = '1';
  String classRoom = '请选择教室';
  String duration = '15分钟';
  String studentName ='请选择学生';
  double classEnvironment = 2;

  void openModalPicker (BuildContext context, {@required adapter, title, @required confirmCallback}) {
    Picker picker = Picker(
        adapter: adapter,
        changeToFirst: false,
        itemExtent: 40,
        height: 200,
        cancelText: '取消',
        confirmText: '确定',
        cancelTextStyle: TextStyle(fontSize: 12, color: Color(0xff969799)),
        confirmTextStyle: TextStyle(fontSize: 12, color: Color(0xff576b95)),
        title: Container(
          child: Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xff2c3e50))),
        ),
        textAlign: TextAlign.center,
        onConfirm: confirmCallback
    );
    picker.showModal(context);
  }
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xfff9f9f9),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.keyboard_backspace, color: Color(0xff000000), size: 24,),
            onPressed: null
        ),
        centerTitle: true,
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Color(0xffffffff),
        title: Text('老师排课', style: TextStyle(color: Color(0xff4a4a4a), fontSize: 16, fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color:  Color(0xfff9f9f9),
              ),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
              child: ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color: Color(0xfff6f6f6)
                                  )
                              )
                          ),
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  child: Text('课程名称', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xff4a4a4a)),)
                              ),
                              GestureDetector(
                                onTap: (){

                                },
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      child: Text(courseName, style: TextStyle(color: Color(0xffd3d3d3), fontSize: 12)),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 6),
                                      child: Icon(Icons.arrow_forward_ios, size: 10, color: Color(0xff999999),),
                                    )
                                  ],
                                )
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color: Color(0xfff6f6f6)
                                  )
                              )
                          ),
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  child: Text('上课方式', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xff4a4a4a)),)
                              ),
                              Row(
                                children: <Widget>[
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          classEnvironment = 2;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            child: Image.asset(classEnvironment == 2 ? 'images/icon_radio_active.png' : 'images/icon_radio_default.png', width: 12, fit: BoxFit.contain,),
                                            margin: EdgeInsets.only(right: 5),
                                          ),
                                          Container(
                                            child: Text('现场课', style: TextStyle(fontSize: 12, color: classEnvironment == 2 ? Color(0xff4a4a4a) : Color(0xff9b9b9b))),
                                            margin: EdgeInsets.only(right: 15),
                                          )
                                        ],
                                      )
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          classEnvironment = 1;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            child: Image.asset(classEnvironment == 1 ? 'images/icon_radio_active.png' : 'images/icon_radio_default.png', width: 12, fit: BoxFit.contain,),
                                            margin: EdgeInsets.only(right: 5),
                                          ),
                                          Container(
                                            child: Text('网络课', style: TextStyle(fontSize: 12, color: classEnvironment == 1 ? Color(0xff4a4a4a) : Color(0xff9b9b9b))),
                                            margin: EdgeInsets.only(right: 15),
                                          )
                                        ],
                                      )
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color: Color(0xfff6f6f6)
                                  )
                              )
                          ),
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  child: Text('本课课时', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xff4a4a4a)),)
                              ),
                              GestureDetector(
                                  onTap: (){
                                    openModalPicker(
                                      context,
                                      adapter: PickerDataAdapter(pickerdata: periods, isArray: false),
                                      title: '请选择课时',
                                      confirmCallback: (Picker picker, List value) {
                                        setState(() {
                                          classPeriods = '${picker.getSelectedValues()[0]}';
                                        });
                                      }
                                    );
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        width: 100,
                                        child: Text(classPeriods, textAlign: TextAlign.right, style: TextStyle(color: Color(0xff333333), fontSize: 12)),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 6),
                                        child: Icon(Icons.arrow_forward_ios, size: 10, color: Color(0xff999999),),
                                      )
                                    ],
                                  )
                              )
                            ],
                          ),
                        ),
                        classEnvironment == 2 ?
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color: Color(0xfff6f6f6)
                                  )
                              )
                          ),
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  child: Text('教室', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xff4a4a4a)),)
                              ),
                              GestureDetector(
                                  onTap: (){

                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: Text(classRoom, style: TextStyle(color: Color(0xffd3d3d3), fontSize: 12)),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 6),
                                        child: Icon(Icons.arrow_forward_ios, size: 10, color: Color(0xff999999),),
                                      )
                                    ],
                                  )
                              )
                            ],
                          ),
                        )
                        : Container(),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color: Color(0xfff6f6f6)
                                  )
                              )
                          ),
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  child: Text('上课时长', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xff4a4a4a)),)
                              ),
                              GestureDetector(
                                  onTap: (){
                                    openModalPicker(
                                        context,
                                        adapter: PickerDataAdapter(pickerdata: times, isArray: false),
                                        title: '请选择课时',
                                        confirmCallback: (Picker picker, List value) {
                                        setState(() {
                                          duration = '${picker.getSelectedValues()[0]}分钟';
                                        });
                                      }
                                    );
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: Text(duration, style: TextStyle(color: Color(0xff333333), fontSize: 12)),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 6),
                                        child: Icon(Icons.arrow_forward_ios, size: 10, color: Color(0xff999999),),
                                      )
                                    ],
                                  )
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color: Color(0xfff6f6f6)
                                  )
                              )
                          ),
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  child: Text('选择学生', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xff4a4a4a)),)
                              ),
                              GestureDetector(
                                  onTap: (){

                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: Text(studentName, style: TextStyle(color: Color(0xffd3d3d3), fontSize: 12)),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 6),
                                        child: Icon(Icons.arrow_forward_ios, size: 10, color: Color(0xff999999),),
                                      )
                                    ],
                                  )
                              )
                            ],
                          ),
                        ),
                      ],
                    ),

                  ),
                  Container()
                ],
              )

            ),

          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
            width: 345,
            height: 50,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
                color: Color(0xfffed846),
                borderRadius: BorderRadius.circular(4)
            ),
            child: Text('确定', textAlign: TextAlign.center, style: TextStyle(color: Color(0xff333333), fontSize: 12, fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
}