part of 'country_bloc.dart';

abstract class CountryState extends Equatable {
  const CountryState();
}

final class CountryInitial extends CountryState {
  @override
  List<Object> get props => [];
}

final class CountryInProgress extends CountryState {
  @override
  List<Object?> get props => [];
}

final class CountrySuccess extends CountryState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

final class CountryFailure extends CountryState {
  @override
  List<Object?> get props => [];
}
