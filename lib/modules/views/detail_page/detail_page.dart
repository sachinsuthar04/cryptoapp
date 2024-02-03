import 'package:cryptoapp/modules/bloc/coin_bloc.dart';
import 'package:cryptoapp/modules/common/custom_snackbar.dart';
import 'package:cryptoapp/modules/domain/models/coin_response.dart';
import 'package:cryptoapp/resources/strings.dart';
import 'package:cryptoapp/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.coin,
    this.fromHome = false,
  }) : super(key: key);
  final CoinResponse coin;
  final bool? fromHome;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CoinBloc, CoinState>(
      listener: (context, state) {
        if (state is CoinAddedFavourite) {
          CustomSnackbar.pushSnackbar(
            context,
            Strings.favourite,
            error: false,
          );
        } else if (state is CoinUnFavourite) {
          CustomSnackbar.pushSnackbar(
            context,
            Strings.unfavourite,
            error: false,
          );
          BlocProvider.of<CoinBloc>(context).add(FetchFromDatabaseData());
          context.pop();
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          centerTitle: true,
          title: Text('Coin Detail',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: AppColors.white)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${coin.rank}. ${coin.name} (${coin.symbol}) ',
                    style: Theme.of(context).textTheme.headlineMedium!),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("First Historical Data : ",
                        style: Theme.of(context).textTheme.bodyMedium!),
                    Text(
                      DateFormat("MMM dd, y HH:mm")
                          .format(coin.firstHistoricalData),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColors.myPrimary),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Last Historical Data : ",
                      style: Theme.of(context).textTheme.bodyMedium!,
                    ),
                    Text(
                      DateFormat("MMM dd, y HH:mm")
                          .format(coin.lastHistoricalData),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColors.myPrimary),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Platform',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      'Name :',
                      style: Theme.of(context).textTheme.bodyMedium!,
                    ),
                    Text(
                      coin.platform.name.isNotEmpty ? coin.platform.name : "",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColors.myPrimary),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      'Symbol :',
                      style: Theme.of(context).textTheme.bodyMedium!,
                    ),
                    Text(
                      coin.platform.symbol.isNotEmpty
                          ? coin.platform.symbol
                          : "",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColors.myPrimary),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.primary),
                  ),
                  onPressed: () {
                    if (fromHome!) {
                      BlocProvider.of<CoinBloc>(context)
                          .add(AddFavouriteData(coin));
                    } else {
                      BlocProvider.of<CoinBloc>(context)
                          .add(DeleteFavouriteData(coin.key ?? 0));
                    }
                  },
                  child: Text(
                    fromHome! ? Strings.addFavourite : Strings.removeFavourite,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppColors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
