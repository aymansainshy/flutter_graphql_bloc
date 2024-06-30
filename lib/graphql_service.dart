import 'package:flutter_graphql_and_bloc/graphql_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlResult<T> {
  final T? data;
  final int? code;
  final String? error;

  GraphqlResult({
    this.data,
    this.code,
    this.error,
  });
}

class GraphqlResultSuccess<T> extends GraphqlResult<T> {
  GraphqlResultSuccess({
    required super.data,
    super.code = 1,
  });
}

class GraphqlResultFailure<T> extends GraphqlResult<T> {
  GraphqlResultFailure({
    required super.error,
    super.code = 0,
  });
}



abstract class NetworkServices<T> {
  Future<GraphqlResult<T>> query({required QueryOptions queryOptions});

  Future<GraphqlResult<T>> mutation({required MutationOptions mutationOptions});
}


class GraphqlService implements NetworkServices {

  final client = GraphQlConfig.getClient();

  @override
  Future<GraphqlResult> query({required QueryOptions<Object?> queryOptions}) async{
    final QueryResult result = await client.query(queryOptions);

    if (result.hasException) {
      return GraphqlResultFailure(error : "Something went wrong");
    } else {
      return GraphqlResultSuccess(data: result.data);
    }
  }

  @override
  Future<GraphqlResult> mutation({required MutationOptions<Object?> mutationOptions}) async{
    final QueryResult result = await client.mutate(mutationOptions);

    if (result.hasException) {
      return GraphqlResultFailure(error : "Something went wrong");
    } else {
      return GraphqlResultSuccess(data: result.data);
    }
  }

}