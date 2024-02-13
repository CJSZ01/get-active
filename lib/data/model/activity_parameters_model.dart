import 'package:signal_poc/extensions.dart';

final class ActivityParametersModel {
  final String type;
  final int participants;

  ActivityParametersModel({
    required this.type,
    required this.participants,
  });

  ActivityParametersModel copyWith({
    String? type,
    int? participants,
  }) {
    return ActivityParametersModel(
      type: type ?? this.type,
      participants: participants ?? this.participants,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type.convertType(),
      'participants': participants.toString(),
    };
  }

  factory ActivityParametersModel.fromMap(Map<String, dynamic> map) {
    return ActivityParametersModel(
      type: map['type'] as String,
      participants: map['participants'] as int,
    );
  }
  @override
  String toString() =>
      'ActivityParametersModel(type: $type, participants: $participants)';

  @override
  bool operator ==(covariant ActivityParametersModel other) {
    if (identical(this, other)) return true;

    return other.type == type && other.participants == participants;
  }

  @override
  int get hashCode => type.hashCode ^ participants.hashCode;
}
