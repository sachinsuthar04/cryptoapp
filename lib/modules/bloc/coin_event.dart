part of 'coin_bloc.dart';

@immutable
abstract class CoinEvent {}

class FetchCoinData extends CoinEvent {
  final int count;
  final int loadingType;

  FetchCoinData(this.count, this.loadingType);
}

class FetchFromDatabaseData extends CoinEvent {}

class AddFavouriteData extends CoinEvent {
  final CoinResponse coinResponse;

  AddFavouriteData(this.coinResponse);
}

class DeleteFavouriteData extends CoinEvent {
  final int key;

  DeleteFavouriteData(this.key);
}
