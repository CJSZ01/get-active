import 'dart:convert';

final class ActivityModel {
  final String activity;
  final String type;
  final int participants;
  final double price;
  final String link;
  final String key;
  final double accessibility;

  ActivityModel(
      {required this.activity,
      required this.type,
      required this.participants,
      required this.price,
      required this.link,
      required this.key,
      required this.accessibility});

  ActivityModel copyWith({
    String? activity,
    String? type,
    double? price,
    String? link,
    String? key,
    double? accessibility,
  }) {
    return ActivityModel(
      activity: activity ?? this.activity,
      type: type ?? this.type,
      participants: participants,
      price: price ?? this.price,
      link: link ?? this.link,
      key: key ?? this.key,
      accessibility: accessibility ?? this.accessibility,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'activity': activity,
      'type': type,
      'participants': participants,
      'price': price,
      'link': link,
      'key': key,
      'accessibility': accessibility,
    };
  }

  factory ActivityModel.fromMap(Map<String, dynamic> map) {
    return ActivityModel(
      activity: map['activity'] as String,
      type: map['type'] as String,
      participants: map['participants'],
      price: double.parse(
        map['price'].toString(),
      ),
      link: map['link'] as String,
      key: map['key'] as String,
      accessibility: double.parse(
        map['accessibility'].toString(),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ActivityModel.fromJson(String source) =>
      ActivityModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ActivityModel(activity: $activity, type: $type, participants: $participants price: $price, link: $link, key: $key, accessibility: $accessibility)';
  }

  @override
  bool operator ==(covariant ActivityModel other) {
    if (identical(this, other)) return true;

    return other.activity == activity &&
        other.type == type &&
        other.participants == participants &&
        other.price == price &&
        other.link == link &&
        other.key == key &&
        other.accessibility == accessibility;
  }

  @override
  int get hashCode {
    return activity.hashCode ^
        type.hashCode ^
        participants.hashCode ^
        price.hashCode ^
        link.hashCode ^
        key.hashCode ^
        accessibility.hashCode;
  }
}
