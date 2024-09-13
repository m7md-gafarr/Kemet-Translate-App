import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:kemet_translate/model/translate.dart';
import 'package:kemet_translate/view%20_model/view_translate.dart';
import 'package:meta/meta.dart';
import 'package:share_plus/share_plus.dart';

part 'translate_cubit_state.dart';

class TranslateCubit extends Cubit<TranslateCubitState> {
  TranslateCubit() : super(TranslateCubitInitial());

  TranslateFunText({required String arabicText}) async {
    emit(TranslateCubitLoading());
    try {
      TranslateModel translateModel =
          await TranslateViewModel().FetchTextTranslate(arabicText: arabicText);
      emit(TranslateCubitSuccess(translateModel: translateModel));
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        emit(TranslateCubitFailear(
            ErrorMessage: e.response!.statusMessage.toString()));
      } else {
        emit(TranslateCubitFailear(ErrorMessage: e.toString()));
      }
    }
  }

  TranslateFunImage({required XFile image}) async {
    String Text = await TranslateViewModel().FetchImageTranslate(image: image);
    TranslateFunText(arabicText: Text);
    return Text;
  }
}
