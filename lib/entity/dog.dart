import 'package:json_annotation/json_annotation.dart';

part 'dog.g.dart';


@JsonSerializable()
class Dog extends Object {

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'status')
  String status;

  Dog(this.message,this.status,);

  factory Dog.fromJson(Map<String, dynamic> srcJson) => _$DogFromJson(srcJson);

}


