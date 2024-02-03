part of 'coin_bloc.dart';

@immutable
abstract class CoinState {}

class CoinInitial extends CoinState {}

class CoinLoading extends CoinState {}

class CoinLoaded extends CoinState {
  final List<CoinResponse> coins;

  CoinLoaded(this.coins);
}

class CoinFavouriteLoading extends CoinState {}

class CoinFavouriteLoaded extends CoinState {
  final List<CoinResponse> coins;

  CoinFavouriteLoaded(this.coins);
}

class CoinFavouriteError extends CoinState {
  final String message;

  CoinFavouriteError(this.message);
}

class CoinError extends CoinState {
  final String message;

  CoinError(this.message);
}

class CoinAddedFavourite extends CoinState {}

class CoinUnFavourite extends CoinState {
  final List<CoinResponse> coins;

  CoinUnFavourite(this.coins);
}
