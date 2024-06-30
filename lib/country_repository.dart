import 'package:flutter_graphql_and_bloc/graphql_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CountryRepository {
  final GraphqlService graphqlService = GraphqlService();

  Future<GraphqlResult<dynamic>> countryQuery() async {
    const String getCountryQuery = r'''
      query {
        countries {
          code
          name
          emoji
        }
      }
    ''';
    final queryOptions = QueryOptions(document: gql(getCountryQuery));
    return await graphqlService.query(queryOptions: queryOptions);
  }

  Future<GraphqlResult<dynamic>> countryQueryByCode(String code) async {
    // BR
    const String getCountryQueryByCode = r'''
     query($code: String) {
            country(code: $code) {   
                name
                native
                capital
                emoji
                currency
                languages {
                    code
                    name
                }
            }
     }
    ''';
    final queryOptions = QueryOptions(
      document: gql(getCountryQueryByCode),
      variables: {
        "code": code,
      },
    );
    return await graphqlService.query(queryOptions: queryOptions);
  }


  // Stream<List> subscribeToUserAdditions() {
  //   const String userAddedSubscription = r'''
  //     subscription {
  //       userAdded {
  //         id
  //         name
  //         email
  //       }
  //     }
  //   ''';
  //
  //   final Stream<QueryResult> subscription = graphqlService.subscribe(
  //     SubscriptionOptions(document: gql(userAddedSubscription)),
  //   );
  //
  //   return subscription.map((result) {
  //     if (result.hasException) {
  //       throw Exception(result.exception.toString());
  //     }
  //     return [result.data?['userAdded'] ?? []];
  //   });
  // }
}
