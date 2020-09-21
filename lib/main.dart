import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './components/navigater.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() {
//  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
        PickerLocalizationsDelegate.delegate, // 如果要使用本地化，请添加此行，则可以显示中文按钮
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('zh', 'CH'),
        const Locale('ko', 'KO'),
        const Locale('it', 'IT'),
        const Locale('ar', 'AR'),
        const Locale('tr','TR')
      ],
      routes: {
//        "webview": (context) => WebView()
      },
      home: TabNavigator()
    );
  }
}























// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'list.dart';
// import 'detail.dart';
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//     @override
//     Widget build(BuildContext context) {
//         return MaterialApp(
//             title: 'Flutter Demo',
//             routes: {
//                 "ListPage": (context) => ListPage(),
//                 "Detail":(context)=> Detail()
//             },
//             home: MyHomePage(),
//         );
//     }

// }
// class MyHomePage extends StatefulWidget {
//    @override
//     MyHomePageState createState() => MyHomePageState();
// }

// class MyHomePageState extends State<MyHomePage> {
//     // var msg = "Hello World!";
//     TextEditingController _accountEditController = TextEditingController();
//     TextEditingController _pwdEditController = TextEditingController();
//     GlobalKey _formKey = GlobalKey<FormState>();
//     @override
//     void didChangeDependencies() {
//       super.didChangeDependencies();
//       print(123123);
//     }
//     @override
//     void didUpdateWidget(oldWidget) {
//         print('didUpdateWidget1');
//         super.didUpdateWidget(oldWidget);
//     }
//     @override
//     Widget build(BuildContext context) {
//         return Scaffold(
//             appBar: AppBar(
//                 title: Text("表单")
//             ),
//             body: Padding(
//                 padding:  EdgeInsets.symmetric(vertical: 40, horizontal: 20),
//                 child: Form(
//                     key: _formKey,
//                     autovalidate: true,
//                     child: Column(
//                         children: <Widget>[
//                             _buildAccount(),
//                             Padding(
//                                 padding: EdgeInsets.fromLTRB(0, 0, 0, 20)
//                             ),
//                             _buildPassword(),
//                             _buildButton()
//                         ]
//                     )
//                 ),
//             )
//         );
//     }
//     Widget _buildAccount() {
//         return TextFormField(
//             autofocus: false,
//             controller: _accountEditController,
//             inputFormatters: [
//                 // 只允许输入数字和字母
//                 WhitelistingTextInputFormatter(RegExp("[a-zA-Z]|[0-9]")),
//                 // 限制10个字符串
//                 LengthLimitingTextInputFormatter(10)
//             ],
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(4),
//                 ),
//                 contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
//                 // labelText: '用户名', 
                
//                 hintText: '请输入用户账号', 
//                 icon: Icon(Icons.person),
//             ),
//             validator: (v) {
//                 return v.trim().length < 6 ? '账号不能小于6位' : null;
//             }
//         );
//     }
//     Widget _buildPassword() {
//         return TextFormField(
//             autofocus: false,
//             controller: _pwdEditController,
//             obscureText: true,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(4),
//                 ),
//                 contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
//                 // labelText: '用户名', 
                
//                 hintText: '请输入密码', 
//                 icon: Icon(Icons.lock),
//             ),
//             validator: (v) {
//                 return v.trim().length > 0 ? null : '密码不能为空';
//             }
//         );
//     }
//     Widget _buildButton() {
//         return Padding(
//             padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
//             child: Row(
//                 children: <Widget>[
//                     Expanded(
//                         child: OutlineButton(
//                             padding: EdgeInsets.all(5),
//                             child: Text('登录', style: TextStyle(fontSize: 20)),
//                             textColor: Color.fromRGBO(0, 0, 0, 0.4),
//                             highlightColor: Colors.white,
//                             splashColor: Colors.white,
//                             onPressed: () {
//                                 print(_accountEditController.text);
//                                 print(_pwdEditController.text);
//                             },
//                         ),
//                     )
//                 ],
//             ),
//         );
//     }
//     // Widget toast () {
//     //     return OverlayEntry()
//     // }
//     // Widget build(BuildContext context) {
//     //     return Scaffold(
//     //         appBar: AppBar(
//     //             title: Text("我是title"),
//     //         ),
//     //         body: Center(
//     //             child: Container(
//     //                 padding: EdgeInsets.all(20),
//     //                 child: Column(
//     //                     children: <Widget>[
//     //                         Image(
//     //                             image: AssetImage("assets/images/jianlai.jpg"), width: 200
//     //                         ),
//     //                         Padding(
//     //                             padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
//     //                         ),
//     //                         Container(
//     //                             width: 100,
//     //                             child: Text(
//     //                                 "Hello World!Hello World!Hello World!Hello World!Hello World!Hello World!Hello World!Hello World!",
//     //                                 maxLines: 1,
//     //                                 overflow: TextOverflow.ellipsis,
//     //                             ),
//     //                         ),
//     //                         Padding(
//     //                             padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
//     //                         ),
//     //                         Form(
                                
//     //                             child: TextFormField(
//     //                                 controller: TextEditingController(),
//     //                                 decoration: InputDecoration(
//     //                                     labelText: '用户名', hintText: '请输入用户账号', icon: Icon(Icons.person)
//     //                                 ),
//     //                                 // 验证
//     //                                 validator: (v) {
//     //                                     return v.trim().length < 6 ? '账号不能小于6位' : null;
//     //                                 },
//     //                             )
//     //                             // child: TextField(
                                    
//     //                             //     keyboardType: TextInputType.text,
//     //                             // ),
//     //                         ),    
//     //                         FlatButton(
//     //                             color: Colors.blue,
//     //                             textColor: Colors.white,
//     //                             onPressed: () {
//     //                                 Navigator.pushNamed(context, "ListPage");
                                    
//     //                             },
//     //                             child: Text(
//     //                                 "跳转",
//     //                                 style: TextStyle(fontSize: 20),
//     //                             ),
//     //                         )
//     //                     ],
//     //                 ),
                    
//     //             )

//     //         )
//     //     );
//     // }
// }