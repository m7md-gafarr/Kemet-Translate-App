part of 'translate_cubit_cubit.dart';

@immutable
sealed class TranslateCubitState {}

final class TranslateCubitInitial extends TranslateCubitState {}

final class TranslateCubitLoading extends TranslateCubitState {}

final class TranslateCubitSuccess extends TranslateCubitState {
  final TranslateModel translateModel;
  TranslateCubitSuccess({required this.translateModel});
}

final class TranslateCubitFailear extends TranslateCubitState {
  final String ErrorMessage;
  TranslateCubitFailear({required this.ErrorMessage});
}
