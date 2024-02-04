part of 'coin_bloc.dart';

@immutable
abstract class CoinState {}

class CoinInitial extends CoinState {}

class CoinLoading extends CoinState {
  final int? count;

  CoinLoading({this.count});

  @override
  List<Object?> get props => [count];
}

class CoinLoaded extends CoinState {
  final List<CoinResponse> coins;
  final bool? loading;

  CoinLoaded({
    required this.coins,
    this.loading = false,
  });

  @override
  List<Object> get props => [
        coins,
        loading!,
      ];

  CoinLoaded copyWith({
    List<CoinResponse>? coins,
    bool? loading,
  }) {
    return CoinLoaded(
      coins: coins ?? this.coins,
      loading: loading ?? this.loading,
    );
  }
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
