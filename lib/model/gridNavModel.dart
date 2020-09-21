import 'package:myapp/model/gridCommonModel.dart';

class GridNav {
  GridCommon hotel;
  GridCommon flight;
  GridCommon travel;
  GridNav({this.hotel, this.travel, this.flight});
  GridNav.fromJson(Map<String, dynamic> json) {
    hotel = GridCommon.fromJson(json['hotel']);
    flight = GridCommon.fromJson(json['flight']);
    travel = GridCommon.fromJson(json['travel']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hotel'] = this.hotel.toJson();
    data['flight'] = this.flight.toJson();
    data['travel'] = this.travel.toJson();
    return data;
  }
}