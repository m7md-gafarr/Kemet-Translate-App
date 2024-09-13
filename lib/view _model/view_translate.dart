import 'package:dio/dio.dart';
import 'package:kemet_translate/model/translate.dart';
import 'package:kemet_translate/services/translateServices.dart';
import 'package:share_plus/share_plus.dart';

class TranslateViewModel {
  Future<TranslateModel> FetchTextTranslate(
      {required String arabicText}) async {
    TranslateModel translateModel =
        await TranslateService(dio: Dio()).translateText(arabicText);
    return translateModel;
  }

  Future<String> FetchImageTranslate({required XFile image}) async {
    String Text = await TranslateService(dio: Dio()).translateImage(image);
    return Text;
  }
}
