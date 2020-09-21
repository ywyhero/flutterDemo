import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  Calendar({Key key, this.type, this.callback})
      :super(key: key);
  final callback;
  final String type;
  @override
  _Calendar createState() => _Calendar();
}
class MonthModel {
  int year = 0;
  String month = '';
  GlobalKey key;
  List<DayModel> days = [];
}
class DayModel {
  int year = 0;
  String month = '';
  String day = '';
  int timeStamp = 0;
  bool disabled = false;
  bool isSelect = false;
  bool isDuration = false;
}
class _Calendar extends State<Calendar> {
  List<MonthModel> calendar = [];
  List<DayModel> selectDays = [];
  String titleDate = '';

  void initState() {
    super.initState();
    getCalendar();
  }
  void reassemble() {
    getCalendar();
    setState(() {
      selectDays = [];
    });
  }
  void getCalendar() {
    var today = DateTime.now();
    var maxDay = DateTime(today.year, today.month, today.day).add(new Duration(days: 180));
    var maxTimeStamp = maxDay.millisecondsSinceEpoch;
    var maxMonth = maxDay.month;
    var currentMonth = today.month;
    var currentYear = today.year;
    var monthDuration = maxMonth < currentMonth ? 12 +  maxMonth - currentMonth + 1 : maxMonth - currentMonth + 1;
    var finalYear = currentYear;
    List<MonthModel> calendarList = [];
    for(int i = 0; i < monthDuration; i++) {
      MonthModel months =  MonthModel();
      var finalMonth = currentMonth + i > 12 ? currentMonth + i - 12 : currentMonth + i;
      finalYear = currentMonth + i > 12 ? finalYear + 1 : finalYear;
      var finalDate = DateTime(finalYear, finalMonth, 1);
      var finalWeek = finalDate.weekday;
      months.year = finalYear;
      months.month = finalMonth >= 10 ? '${finalMonth}' : '0${finalMonth}';
      months.key = GlobalKey();
      var startTime = DateTime(finalYear, finalMonth, 1).millisecondsSinceEpoch - (finalWeek - 1) * 24 * 60 * 60 * 1000;
      for(int j = 0; j < 42; j++) {
        DayModel dayObj = DayModel();
        var newTimeStamp = startTime + j * 24 * 60 * 60 * 1000;
        var dayTime = DateTime.fromMillisecondsSinceEpoch(newTimeStamp);
        var dayMonth = dayTime.month >= 10 ? '${dayTime.month}' : '0${dayTime.month}';
        if(dayMonth == months.month && maxTimeStamp >= newTimeStamp) {
          if(newTimeStamp <  DateTime(today.year, today.month, today.day).millisecondsSinceEpoch){
            dayObj.disabled = true;
          }
          dayObj.year = dayTime.year;
          dayObj.month = dayMonth;
          dayObj.day = dayTime.day >= 10 ? '${dayTime.day}' : '0${dayTime.day}';
          dayObj.timeStamp = newTimeStamp;
          months.days.add(dayObj);
        }

      }
      for(int k = 0; k < finalWeek - 1; k++) {
        DayModel dayEmpty = DayModel();
        months.days.insert(0, dayEmpty);
      }
      calendarList.add(months);
    }
    setState(() {
      calendar = calendarList;
      titleDate = '${calendarList[0].year}年${calendarList[0].month}月';
    });
  }
  monthItems(BuildContext context, calendar, type) {
    if(calendar == null) {
      return null;
    }
    List<Widget> monthWidgets = [];
    for(int i = 0; i < calendar.length; i++) {
      monthWidgets.add(monthItem(context,calendar[i], i, type));
    }
    return monthWidgets;
  }
  Widget monthItem(BuildContext context, MonthModel month, int montIndex, type) {
    var days = month.days;
    List<Widget> dayWidgets = [];
    for(int i = 0; i < days.length; i++) {
      dayWidgets.add(dayItem(context, days[i], montIndex, i, type));
    }
    return Container(
      key: month.key,
      padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Color(0xffffffff),
          border: Border(
              bottom: BorderSide(
                  width: 1,
                  color: Color(0xffe9e9e9)
              )
          )
      ),
      child: Column(
        children: <Widget>[
          Container(
            child: Text('${month.year}年${month.month}月', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Wrap(
              children: dayWidgets,
            ) ,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
          ),
        ],
      ),
    );
  }
  Widget dayItem(BuildContext context, DayModel day, int monthIndex, int index, type) {
    return GestureDetector(
        onTap: () {
          if(day.disabled == false) {
            var selectDayLists = selectDays;
            var calendarLists = calendar;
            var selectIndex = -1;
            if(type == 'freedom') {
              calendarLists[monthIndex].days[index].isSelect == true ? calendarLists[monthIndex].days[index].isSelect = false : calendarLists[monthIndex].days[index].isSelect = true;
              if(selectDayLists.length > 0) {
                for(int i = 0; i < selectDayLists.length; i++) {
                  if(selectDayLists[i].timeStamp == day.timeStamp) {
                    selectIndex = i;
                  }
                }
              } else {
                selectIndex = -1;
              }
              if(selectIndex > -1) {
                selectDayLists.removeAt(selectIndex);
              } else {
                selectDayLists.add(day);
              }
              setState(() {
                calendar = calendarLists;
                selectDays = selectDayLists;
              });
            } else if(type == 'loop') {
              if (selectDayLists.length == 2) {
                for (int i = 0; i < calendarLists.length; i++) {
                  for (int j = 0; j < calendarLists[i].days.length; j++) {
                    calendarLists[i].days[j].isSelect = false;
                    calendarLists[i].days[j].isDuration = false;
                  }
                }
                selectDayLists = [];
              }
              if(selectDayLists.length < 2){
                calendarLists[monthIndex].days[index].isSelect == true ? calendarLists[monthIndex].days[index].isSelect = false : calendarLists[monthIndex].days[index].isSelect = true;
                if(selectDayLists.length > 0) {
                  for(int i = 0; i < selectDayLists.length; i++) {
                    if(selectDayLists[i].timeStamp == day.timeStamp) {
                      selectIndex = i;
                    }
                  }
                } else {
                  selectIndex = -1;
                }
                print(selectIndex);
                if(selectIndex > -1) {
                  selectDayLists.removeAt(selectIndex);
                } else {
                  selectDayLists.add(day);
                }

              }
              selectDayLists.sort((a,b)=>a.timeStamp.compareTo(b.timeStamp));
              if (selectDayLists.length == 2) {
                for (int i = 0; i < calendarLists.length; i++) {
                  for (int j = 0; j < calendarLists[i].days.length; j++) {
                    if (calendarLists[i].days[j].timeStamp > selectDayLists[0].timeStamp && calendarLists[i].days[j].timeStamp < selectDayLists[1].timeStamp) {
                      calendarLists[i].days[j].isDuration = true;
                    }
                  }
                }
              }
              setState(() {
                calendar = calendarLists;
                selectDays = selectDayLists;
              });
            }
            widget.callback(selectDayLists);

          }
        },
        child: Container(
            width: 50.56,
            height: 36,
            decoration: day.isDuration ?
            BoxDecoration(
                color: Color(0x33FED846)
            ) : BoxDecoration(),
            margin: EdgeInsets.only(bottom: 10),
            child: Center(
                child: Container(
                  alignment: AlignmentDirectional.center,
                  width: 36,
                  height: 36,
                  decoration: day.isSelect ?
                  BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xffFED846)
                  ) : BoxDecoration(),
                  child: Text('${day.day == '0' ? '' : day.day}', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: day.disabled ? Color(0xffcbcbcb) : Color(0xff333333)),),
                )
            )

        )
    );
  }

  Widget build(BuildContext context){
    return  Container(
      height: double.infinity,
//      width: double.infinity,
      child: Stack(
        children: <Widget>[
          NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification){
                ScrollMetrics metrics = notification.metrics;
                var maxHeight = metrics.extentAfter + metrics.pixels + MediaQuery.of(context).size.height;
                var itemHeight = (maxHeight - 115) / calendar.length;
                var currentMonthIndex = (metrics.pixels/itemHeight).toInt();
                var year = calendar[currentMonthIndex].year;
                var month = calendar[currentMonthIndex].month;
                setState(() {
                  titleDate = '${year}年${month}月';
                });
                return true;
              },
              child: ListView(
                  padding: EdgeInsets.only(top: 20),
                  children: monthItems(context, calendar, widget.type)
              )
          ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: Colors.white
                ),
                child:  Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Text('周一', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.black26),),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text('周二', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.black26),),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text('周三', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.black26),),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text('周四', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.black26),),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text('周五', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.black26),),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text('周六', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.black26),),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text('周日', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.black26),),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 25,
                      child: Text(titleDate, textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),),
                    )
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}