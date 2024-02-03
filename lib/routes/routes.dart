import 'package:cryptoapp/modules/bloc/coin_bloc.dart';
import 'package:cryptoapp/modules/domain/models/coin_response.dart';
import 'package:cryptoapp/modules/repositories/coin_repository.dart';
import 'package:cryptoapp/modules/views/base_layout.dart';
import 'package:cryptoapp/modules/views/detail_page/detail_page.dart';
import 'package:cryptoapp/modules/views/tabbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DynamicRoutes {
  static final coinBloc = CoinBloc(CoinRepository());

  final String name;
  final String path;

  static final startPage = DynamicRoutes(
    name: 'Start',
    path: '/',
  );

  static final home = DynamicRoutes(
    name: 'Home',
    path: '/home',
  );

  static final itemDetailScreen = DynamicRoutes(
    name: 'Item Detail Screen',
    path: 'item-detail-page',
  );

  DynamicRoutes({
    required this.name,
    required this.path,
  });

  static final router = GoRouter(
    restorationScopeId: "counter",
    routes: <RouteBase>[
      _start(),
      _home(),
    ],
  );

  static GoRoute _start() {
    return GoRoute(
      name: startPage.name,
      path: startPage.path,
      redirect: (context, state) {
        return DynamicRoutes.home.path;
      },
    );
  }

  static GoRoute _home() {
    return GoRoute(
      name: home.name,
      path: home.path,
      routes: [
        _itemDetailScreen(),
      ],
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => coinBloc,
            ),
          ],
          child: const BaseLayout(page: TabBarWidget()),
        );
      },
    );
  }

  static _itemDetailScreen() {
    return GoRoute(
      name: itemDetailScreen.name,
      path: itemDetailScreen.path,
      builder: (BuildContext context, GoRouterState state) {
        CoinResponse coinResponse = state.extra as CoinResponse;

        return BlocProvider.value(
          value: coinBloc,
          child: BaseLayout(
            page: DetailPage(
              coin: coinResponse,
              fromHome: coinResponse.key != null ? false : true,
            ),
          ),
        );
      },
    );
  }
}
