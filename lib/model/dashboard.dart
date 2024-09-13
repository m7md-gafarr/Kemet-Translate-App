class DashboardModel {
  DashboardModel({
    required this.UserCount,
    required this.TextCount,
    required this.ImageCount,
    required this.MostTextdata,
    required this.MostTranslateIndaydata,
  });
  final int UserCount;
  final int TextCount;
  final int ImageCount;
  final List<MostText> MostTextdata;
  final List<MostTranslateInday> MostTranslateIndaydata;
}

class MostText {
  MostText({
    required this.Text,
    required this.Count,
  });
  final String Text;
  final int Count;
}

class MostTranslateInday {
  MostTranslateInday({
    required this.day,
    required this.Count,
  });
  final String day;
  final int Count;
}
