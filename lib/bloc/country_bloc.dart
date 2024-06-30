import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_graphql_and_bloc/graphql_service.dart';

import '../country_repository.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final CountryRepository countryRepository = CountryRepository();

  CountryBloc() : super(CountryInitial()) {

    on<GetCountryList>((event, emit) async{
     emit(CountryInProgress());
     final result = await countryRepository.countryQuery();
     print(result.data);
     if(result is GraphqlResultSuccess) {
       print(result.data);
     }
     emit(CountrySuccess());
    });

    on<GetCountryByCode>((event, emit) {
      // TODO: implement event handler
    });
  }
}
