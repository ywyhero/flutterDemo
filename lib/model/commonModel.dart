class CommonModel{
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideBar;
  CommonModel({this.icon, this.title, this.url, this.statusBarColor, this.hideBar});
  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      icon: json['icon'],
      title: json['title'],
      url: json['url'],
      statusBarColor: json['statusBarColor'],
      hideBar: json['hideAppBar']
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['title'] = this.title;
    data['url'] = this.url;
    data['statusBarColor'] = this.statusBarColor;
    data['hideBar'] = this.hideBar;
    return data;
  }
}
