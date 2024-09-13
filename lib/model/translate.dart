class TranslateModel {
  final String Arabic;
  final String Hieroglyphics;

  TranslateModel({required this.Arabic, required this.Hieroglyphics});

  factory TranslateModel.fromjson(json) {
    return TranslateModel(
      Arabic: json['arabic'],
      Hieroglyphics: json['hieroglyphics'],
    );
  }

  factory TranslateModel.empty() {
    return TranslateModel(
      Arabic: '',
      Hieroglyphics: '',
    );
  }
}
