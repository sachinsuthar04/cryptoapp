import 'package:cryptoapp/modules/bloc/coin_bloc.dart';
import 'package:cryptoapp/modules/common/custom_snackbar.dart';
import 'package:cryptoapp/modules/views/detail_page/detail_page.dart';
import 'package:cryptoapp/modules/views/home_page/components/coin_list.dart';
import 'package:cryptoapp/routes/routes.dart';
import 'package:cryptoapp/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  void initState() {
    BlocProvider.of<CoinBloc>(context).add(FetchFromDatabaseData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<CoinBloc, CoinState>(
      listener: (context, state) {
        if (state is CoinError) {
          CustomSnackbar.pushSnackbar(
            context,
            state.message,
            error: true,
          );
        }
      },
      child: RefreshIndicator(
        onRefresh: () {
          BlocProvider.of<CoinBloc>(context).add(FetchFromDatabaseData());
          return Future.value(null);
        },
        child: BlocBuilder<CoinBloc, CoinState>(
          buildWhen: (previous, current) {
            if (current is CoinUnFavourite ||
                current is CoinFavouriteLoaded ||
                current is CoinFavouriteLoading) {
              return true;
            } else {
              return false;
            }
          },
          builder: (context, state) {
            if (state is CoinInitial) {
              return const SizedBox();
            } else if (state is CoinFavouriteLoading) {
              return Scaffold(
                body: Column(
                  children: List.generate(
                      10,
                      (index) => Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                              vertical: 12.0,
                            ),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    color: Colors.white,
                                    height: 40,
                                    width: size.width * 0.4,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    color: Colors.white,
                                    height: 40,
                                    width: size.width * 0.4,
                                  ),
                                ],
                              ),
                            ),
                          )).toList(),
                ),
              );
            } else if (state is CoinFavouriteLoaded) {
              return SafeArea(
                child: Scaffold(
                  body: state.coins.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.coins.length,
                          itemBuilder: (context, index) {
                            final coin = state.coins[index];
                            return CoinList(
                              coin: coin,
                              onTap: () {
                                context.goNamed(
                                    DynamicRoutes.itemDetailScreen.name,
                                    extra: state.coins[index]);
                              },
                            );
                          },
                        )
                      : Center(
                          child: Text(
                          "No favourite item",
                          style: Theme.of(context).textTheme.bodyLarge!,
                        )),
                ),
              );
            } else {
              return Center(
                child: Text('Error Occurred',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppColors.white)),
              );
            }
          },
        ),
      ),
    );
  }
}
