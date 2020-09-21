class GridCommon {
  String startColor;
  String endColor;
  MainItem mainItem;
  Item item1;
  Item item2;
  Item item3;
  Item item4;
  GridCommon({this.startColor, this.endColor, this.mainItem,this.item1, this.item2,this.item4,this.item3});
  GridCommon.fromJson(Map<String, dynamic> json) {
    item1 = Item.fromJson(json['item1']);
    item2 = Item.fromJson(json['item2']);
    item3 = Item.fromJson(json['item3']);
    item4 = Item.fromJson(json['item4']);
    mainItem = MainItem.fromJson(json['mainItem']);
    startColor = json['startColor'];
    endColor = json['endColor'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startColor'] = this.startColor;
    data['endColor'] = this.endColor;
    data['mainItem'] = this.mainItem.toJson();
    data['item1'] = this.item1.toJson();
    data['item2'] = this.item2.toJson();
    data['item3'] = this.item3.toJson();
    data['item4'] = this.item4.toJson();
    return data;
  }
}
class MainItem {
  String title;
  String icon;
  String url;
  String statusBarColor;
  MainItem({this.title, this.icon, this.url, this.statusBarColor});
  MainItem.fromJson(Map<String,dynamic> json) {
    title = json['title'];
    icon = json['icon'];
    url = json['url'];
    statusBarColor = json['statusBarColor'];
  } 
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['title'] = this.title;
    data['url'] = this.url;
    data['statusBarColor'] = this.statusBarColor;
    return data;
  }

}
class Item {
  String title;
  String url;
  String statusBarColor;
  bool hideAppBar;
  Item({this.title, this.url, this.statusBarColor, this.hideAppBar});
  Item.fromJson(Map<String,dynamic> json) {
    title = json['title'];
    url = json['url'];
    statusBarColor = json['statusBarColor'];
    hideAppBar = json['hideAppBar'];
  } 
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['url'] = this.url;
    data['statusBarColor'] = this.statusBarColor;
    data['hideAppBar'] = this.hideAppBar;
    return data;
  }

}