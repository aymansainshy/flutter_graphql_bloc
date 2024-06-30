part of 'country_bloc.dart';

abstract class CountryEvent extends Equatable {
  const CountryEvent();
}

class GetCountryList extends CountryEvent {
  @override
  List<Object?> get props => [];
}

class GetCountryByCode extends CountryEvent {
  final String code;

  const GetCountryByCode(this.code);

  @override
  List<Object?> get props => [];
}
