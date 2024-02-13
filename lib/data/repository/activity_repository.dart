import 'package:signal_poc/data/model/activity_model.dart';
import 'package:signal_poc/data/model/activity_parameters_model.dart';

abstract interface class ActivityRepository {
  Future<ActivityModel?> fetchActivity({
    required ActivityParametersModel activityParametersModel,
  });
}
