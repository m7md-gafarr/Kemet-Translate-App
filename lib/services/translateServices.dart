import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:kemet_translate/constant/string.dart';
import 'package:kemet_translate/model/translate.dart';
import 'package:share_plus/share_plus.dart';

class TranslateService {
  TranslateService({required this.dio});

  final Dio dio;

  Future<TranslateModel> translateText(String arabicText) async {
    final response = await dio.post(
      '$baseUrl/translate',
      data: {
        'text': arabicText,
      },
    );
    if (response.statusCode == 200) {
      return TranslateModel.fromjson(response.data);
    } else {
      throw Exception(" You have a problem in ${response.statusCode}");
    }
  }

  Future<String> translateImage(XFile imageFile) async {
    FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(imageFile.path,
          filename: imageFile.name),
    });

    Response response = await dio.post("$baseUrl/ocr", data: formData);
    if (response.statusCode == 200) {
      return response.data['text'];
    } else {
      throw Exception(" You have a problem in ${response.statusCode}");
    }
  }
}
