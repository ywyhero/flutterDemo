import 'package:flutter/material.dart';
import 'package:myapp/components/loadingContainer.dart';
import 'package:myapp/model/commonModel.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:myapp/model/indexModel.dart';
import 'package:myapp/service/index.dart';
import 'package:myapp/components/squareSwipePagination.dart';
import 'package:myapp/components/localNav.dart';
import 'package:myapp/widget/subNav.dart';
import 'package:myapp/widget/salesBox.dart';
import 'package:myapp/pages/webview.dart';
class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

const APPBAR_SCROLL_OFFSET = 100;

class _IndexState extends State<Index> {
  bool _isLoading = true;
  double appBarAlpha = 0;
  List bannerList = [];
  Object gridNavList;
  Object salesBoxList;
  List<CommonModel> localNavList = [];
  List<CommonModel> subNavList = [];
  @override
  void initState() {
    super.initState();
    _handleRefresh();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xfffafafc),
      body:  Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: NotificationListener(
              onNotification: (scrollNotification){
                // if(scrollNotification is ScrollUpdateNotification && scrollNotification.depth == 0) {
                //   _onSroll(scrollNotification.metrics.pixels);
                // }
                return true;
              },
              child:  ListView(
                  children: <Widget>[
                    Container(
                      height: 262,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 210,
                            child: Image.asset('images/2111.jpg', width: 750)
                            
                          ),
                          Positioned(
                            top: 188,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                              child: LocalNav(
                                localNavList: localNavList,
                              ),
                            )
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                        children: <Widget>[
                          PhysicalModel(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(6),
                            clipBehavior: Clip.antiAlias,
                            child: Container(
                              width: double.infinity,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 72,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        Color(0xfffa5956),
                                        Color(0xffef9c76).withAlpha(45)
                                      ])
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () => {},
                                          child: Container(
                                            width: 110,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              border: Border(
                                                right: BorderSide(
                                                  width: 1,
                                                  color: Colors.white
                                                )
                                              )
                                            ),
                                            child: Stack(
                                              alignment: AlignmentDirectional.bottomEnd,
                                              children: <Widget>[
                                                Image.asset('images/grid-nav-items-hotel.png', width: 70, fit: BoxFit.contain, alignment: AlignmentDirectional.bottomEnd,),
                                                Container(
                                                  alignment: AlignmentDirectional.centerStart,
                                                  margin: EdgeInsets.only(left: 16),
                                                  child: Text('酒店', style: TextStyle(fontSize: 14, color: Colors.white),)
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: GestureDetector(
                                              onTap: () => {},
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    right: BorderSide(
                                                      width: 1,
                                                      color: Colors.white
                                                    ),
                                                  )
                                                ),
                                                child: Stack(
                                                  alignment: AlignmentDirectional.bottomStart,
                                                  children: <Widget>[
                                                    Image.asset('images/grid-nav-items-minsu.png', width: 32, fit: BoxFit.contain, alignment: AlignmentDirectional.bottomStart),
                                                    Container(
                                                      alignment: AlignmentDirectional.center,
                                                      child: Text('民宿·客栈', style: TextStyle(fontSize: 14, color: Colors.white)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: GestureDetector(
                                              onTap: () => {},
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Color(0xffffbc49), Color(0xffffd252)])
                                                ),
                                                child: Stack(
                                                  alignment: AlignmentDirectional.bottomEnd,
                                                  children: <Widget>[
                                                    Image.asset(
                                                      'images/grid-nav-items-jhj.png',
                                                      width: 90,
                                                      fit: BoxFit.contain,
                                                      alignment: AlignmentDirectional.bottomEnd,
                                                    ),
                                                    Container(
                                                      alignment: AlignmentDirectional.center,
                                                      child: Text(
                                                        '机票/火车票+酒店',
                                                        style: TextStyle(fontSize: 14, color: Color(0xffa05416)),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      top: 8,
                                                      right: 24,
                                                      child: Container(
                                                        padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                                                        decoration: BoxDecoration(
                                                            color: Color(0xfff54c45),
                                                            borderRadius: BorderRadius.only(
                                                              topRight: Radius.circular(5),
                                                              topLeft: Radius.circular(8),
                                                              bottomLeft: Radius.circular(0),
                                                              bottomRight: Radius.circular(5),
                                                            )
                                                        ),
                                                        child: Text(
                                                          '方便又便宜',
                                                          style: TextStyle(fontSize: 12, color: Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 1)),
                                  Container(
                                    height: 72,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [Color(0xff4b8fed), Color(0xff53bced)]),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () => {},
                                          child: Container(
                                            width: 110,
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    right: BorderSide(
                                                      width: 1,
                                                      color: Colors.white,
                                                    )
                                                )
                                            ),
                                            child: Stack(
                                              alignment: AlignmentDirectional.bottomEnd,
                                              children: <Widget>[
                                                Image.asset('images/grid-nav-items-flight.png', width: 70, fit: BoxFit.contain, alignment: AlignmentDirectional.bottomEnd,),
                                                Container(
                                                  alignment: AlignmentDirectional.centerStart,
                                                  margin: EdgeInsets.only(left: 16),
                                                  child: Text('机票', style: TextStyle(fontSize: 14, color: Colors.white),),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: GestureDetector(
                                            onTap: () => {},
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  right: BorderSide(
                                                    width: 1,
                                                    color: Colors.white
                                                  )
                                                )
                                              ),
                                              child: Stack(
                                                alignment: AlignmentDirectional.bottomStart,
                                                children: <Widget>[
                                                  Image.asset('images/grid-nav-items-train.png', width: 32, fit: BoxFit.contain, alignment: AlignmentDirectional.bottomStart,),
                                                  Container(
                                                    alignment: AlignmentDirectional.center,
                                                    child: Text('火车票', style: TextStyle(fontSize: 14, color: Colors.white),),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: GestureDetector(
                                            onTap: () => {},
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  right: BorderSide(
                                                    width: 1,
                                                    color: Colors.white
                                                  )
                                                )
                                              ),
                                              child: Container(
                                                alignment: AlignmentDirectional.center,
                                                child: Text('汽车·船票', style: TextStyle(fontSize: 14, color: Colors.white),),
                                              )
                                            ),
                                          )
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: GestureDetector(
                                            onTap: () => {},
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      right: BorderSide(
                                                          width: 1,
                                                          color: Colors.white
                                                      )
                                                  )
                                              ),
                                              child: Container(
                                                alignment: AlignmentDirectional.center,
                                                child: Text('专车·租车', style: TextStyle(fontSize: 14, color: Colors.white),),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],

                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 1)),
                                  Container(
                                    height: 72,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [Color(0xff34c2aa), Color(0xff6cd557)]),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width: 110,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              right: BorderSide(
                                                width: 1,
                                                color: Colors.white
                                              )
                                            )
                                          ),
                                          child: Stack(
                                            alignment: AlignmentDirectional.bottomEnd,
                                            children: <Widget>[
                                              Image.asset('images/grid-nav-items-travel.png', width: 80, fit: BoxFit.contain, alignment: AlignmentDirectional.bottomEnd,),
                                              Container(
                                                alignment: AlignmentDirectional.centerStart,
                                                margin: EdgeInsets.only(left: 16),
                                                child: Text('旅游', style: TextStyle(fontSize: 14, color: Colors.white),),
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: GestureDetector(
                                            onTap: () => {},
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      right: BorderSide(
                                                          width: 1,
                                                          color: Colors.white
                                                      )
                                                  )
                                              ),
                                              child: Stack(
                                                alignment: AlignmentDirectional.bottomStart,
                                                children: <Widget>[
                                                  Image.asset('images/grid-nav-items-dingzhi.png', width: 40, fit: BoxFit.contain, alignment: AlignmentDirectional.bottomStart,),
                                                  Container(
                                                    alignment: AlignmentDirectional.center,
                                                    child: Text('高铁游', style: TextStyle(fontSize: 14, color: Colors.white)),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: GestureDetector(
                                            onTap: () => {},
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      right: BorderSide(
                                                          width: 1,
                                                          color: Colors.white
                                                      )
                                                  )
                                              ),
                                              child: Container(
                                                alignment: AlignmentDirectional.center,
                                                child: Text('游轮游', style: TextStyle(fontSize: 14, color: Colors.white),),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: GestureDetector(
                                            onTap: () => {},
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      right: BorderSide(
                                                          width: 1,
                                                          color: Colors.white
                                                      )
                                                  )
                                              ),
                                              child: Container(
                                                alignment: AlignmentDirectional.center,
                                                child: Text('定制游', style: TextStyle(fontSize: 14, color: Colors.white),),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          SubNav(
                            subNavList: subNavList,
                          ),
                          SalesBox(
                            salesBoxList: salesBoxList,
                          )
                        ],
                      ),
                    ),
                  ],
              
              ),
            ),
          )
        ],
      ),
    );
  }
  void _onSroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if(alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha: alpha;
    });
  }
  Future _handleRefresh() async{
    IndexModel indexModel = await IndexRequest.getBaseInfo();
    print(indexModel);
    setState(() {
      bannerList = indexModel.bannerList;
      localNavList = indexModel.localNavList;
      subNavList = indexModel.subNavList;
      gridNavList = indexModel.gridNav;
      salesBoxList = indexModel.salesBoxList;
      _isLoading = false;
    });
  }
}