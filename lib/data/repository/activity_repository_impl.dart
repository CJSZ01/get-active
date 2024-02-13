import 'package:signal_poc/constants.dart';
import 'package:signal_poc/data/model/activity_model.dart';
import 'package:signal_poc/data/model/activity_parameters_model.dart';
import 'package:signal_poc/data/repository/activity_repository.dart';
import 'package:http/http.dart' as http;

final class ActivityRepositoryImpl implements ActivityRepository {
  @override
  Future<ActivityModel?> fetchActivity(
      {required ActivityParametersModel activityParametersModel}) async {
    final response = await http.get(
      Uri.https(
        Constants.baseUrl,
        Constants.activityEndpoint,
        activityParametersModel.toMap(),
      ),
    );
    if (response.statusCode == 200 && !response.body.contains('error')) {
      return ActivityModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
