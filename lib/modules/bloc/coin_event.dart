part of 'coin_bloc.dart';

@immutable
abstract class CoinEvent {}

class FetchCoinData extends CoinEvent {}

class GetCoinByIdEvent extends CoinEvent {
  final String id;

  GetCoinByIdEvent(this.id);
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
