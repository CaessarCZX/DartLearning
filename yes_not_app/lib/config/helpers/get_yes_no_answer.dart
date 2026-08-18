import 'package:dio/dio.dart';
import 'package:yes_not_app/domain/entities/message.dart';
import 'package:yes_not_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final res = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJson(res.data);

    return yesNoModel.toMessageEntity();
  }
}
