import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

@JsonSerializable()
class ImageRequestModel extends INetworkModel<ImageRequestModel>
    with EquatableMixin {
  final String? image1;
  final String? image2;
  final String? image3;
  final String? image4;
  final String? image5;

  ImageRequestModel(
      {this.image1, this.image2, this.image3, this.image4, this.image5});

  @override
  ImageRequestModel fromJson(Map<String, dynamic> json) {
    return ImageRequestModel(
        image1: json['images'][0] as String?,
        image2: json['images'][1] as String?,
        image3: json['images'][2] as String?,
        image4: json['images'][3] as String?,
        image5: json['images'][4] as String?);
  }

  @override
  List<Object?> get props => [image1, image2, image3, image4, image5];

  @override
  Map<String, dynamic>? toJson() {
    return <String, dynamic>{
      'images': [image1, image2, image3, image4, image5]
    };
  }
}
