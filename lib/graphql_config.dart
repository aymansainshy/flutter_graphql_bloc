import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlConfig {
  static final HttpLink httpLink = HttpLink(
    'https://countries.trevorblades.com/graphql',
  );

  static final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );

  static final WebSocketLink websocketLink = WebSocketLink(
    'wss://your-graphql-endpoint.com/graphql',
    config: SocketClientConfig(
      autoReconnect: true,
      initialPayload: () async {
        return {
          'Authorization': 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
        };
      },
    ),
  );

  static final Link link = authLink.concat(httpLink).concat(websocketLink);

  static final GraphQLClient client = GraphQLClient(
    // cache: GraphQLCache(store: HiveStore(HiveStorage.getUsersBox())),
    cache: GraphQLCache(),
    link: link,
  );

  static GraphQLClient getClient() {
    return client;
  }
}




/**
 * https://countries.trevorblades.com/graphql
 * query {
    countries {
    code
    name
    emoji
    }
    }


 * https://countries.trevorblades.com/graphql
 * query {
    country(code: "BR") {
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
 */