

class SalesBoxModel {
  String icon;
  String moreUrl;
  SalesBoxCommon bigCard1;
  SalesBoxCommon bigCard2;
  SalesBoxCommon smallCard1;
  SalesBoxCommon smallCard2;
  SalesBoxCommon smallCard3;
  SalesBoxCommon smallCard4;
  SalesBoxModel({this.icon, this.moreUrl, this.bigCard1,this.bigCard2,this.smallCard1,this.smallCard2,this.smallCard3,this.smallCard4});
  SalesBoxModel.fromJson(Map<String,dynamic> json) {
    icon = json['icon'];
    moreUrl = json['moreUrl'];
    bigCard1 = SalesBoxCommon.fromJson(json['bigCard1']);
    bigCard2 = SalesBoxCommon.fromJson(json['bigCard2']);
    smallCard1 = SalesBoxCommon.fromJson(json['smallCard1']);
    smallCard2 = SalesBoxCommon.fromJson(json['smallCard2']);
    smallCard3 = SalesBoxCommon.fromJson(json['smallCard3']);
    smallCard4 = SalesBoxCommon.fromJson(json['smallCard4']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['moreUrl'] = this.moreUrl;
    data['bigCard1'] = this.bigCard1.toJson();
    data['bigCard2'] = this.bigCard2.toJson();
    data['smallCard1'] = this.smallCard1.toJson();
    data['smallCard2'] = this.smallCard2.toJson();
    data['smallCard3'] = this.smallCard3.toJson();
    data['smallCard4'] = this.smallCard4.toJson();
    return data;
  }
}

class SalesBoxCommon {
  final String icon;
  final String url;
  final String title;
  final bool hideBar;
  SalesBoxCommon({this.icon, this.url, this.hideBar, this.title});
  factory SalesBoxCommon.fromJson(Map<String, dynamic> json) {
    return SalesBoxCommon(
      icon: json['icon'],
      title: json['title'],
      url: json['url'],
      hideBar: json['hideAppBar']
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['title'] = this.title;
    data['url'] = this.url;
    data['hideBar'] = this.hideBar;
    return data;
  }
}
