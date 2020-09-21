import 'package:myapp/model/commonModel.dart';
import 'package:myapp/model/configModel.dart';
import 'package:myapp/model/gridNavModel.dart';
import 'package:myapp/model/salesBoxModel.dart';
class IndexModel {
  final ConfigModel config;
  List<BannerList> bannerList;
  List<CommonModel> localNavList;
  List<CommonModel> subNavList;
  SalesBoxModel salesBoxList;
  GridNav gridNav;
  IndexModel({
    this.config,
    this.bannerList,
    this.localNavList,
    this.gridNav,
    this.subNavList,
    this.salesBoxList
  });
  factory IndexModel.fromJson(Map<String, dynamic> json) {
    var localNavListJson = json['localNavList'] as List;
    List<CommonModel> localNavList = localNavListJson.map((i) => CommonModel.fromJson(i)).toList();
    var bannerListJson = json['bannerList'] as List;
    List<BannerList> bannerList = bannerListJson.map((i) => BannerList.fromJson(i)).toList();
    var subNavListJson = json['subNavList'] as List;
    List<CommonModel> subNavList = subNavListJson.map((i) => CommonModel.fromJson(i)).toList();
    GridNav gridNav = GridNav.fromJson(json['gridNav']);
    SalesBoxModel salesBoxList = SalesBoxModel.fromJson(json['salesBox']);
    return IndexModel(
      localNavList: localNavList,
      bannerList: bannerList,
      subNavList: subNavList,
      gridNav: gridNav,
      salesBoxList: salesBoxList,
      config: ConfigModel.fromJson(json['config'])
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.config != null) {
      data['config'] = this.config.toJson();
    }
    data['bannerList'] = this.bannerList;
    data['subNavList'] = this.subNavList;
    data['localNavList'] = this.localNavList;
    data['salesBoxList'] = this.salesBoxList;
    data['gridNav'] = this.gridNav.toJson();
    return data;
  }
}

class BannerList {
  String icon;
  String sIcon;
  String url;
  BannerList({this.icon, this.sIcon, this.url});
  BannerList.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    sIcon = json['sIcon'];
    url = json['url'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['sIcon'] = this.sIcon;
    data['url'] = this.url;
    return data;
  }
}