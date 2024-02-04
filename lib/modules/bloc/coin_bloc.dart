import 'package:bloc/bloc.dart';
import 'package:cryptoapp/modules/domain/models/coin_response.dart';
import 'package:cryptoapp/modules/repositories/coin_repository.dart';
import 'package:meta/meta.dart';

part 'coin_event.dart';

part 'coin_state.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  final CoinRepository coinRepository = CoinRepository();

  ///This bloc is manage all event where we are fetch data from API &
  ///add to favourite in HIve database and remove from favourite
  CoinBloc(CoinRepository coinRepository)
      : super(
          CoinInitial(),
        ) {
    on<CoinEvent>((event, emit) async {
      final current = state;
      try {
        List<CoinResponse> prevData = [];
        if (event is FetchCoinData) {
          if (current is CoinLoaded) {
            prevData = current.coins == null ? [] : List.of(current.coins);
            if (event.loadingType == 1) {
              emit(current.copyWith(
                coins: current.coins,
                loading: true,
              ));
            }
          }
          if (event.loadingType == 0) {
            emit(CoinLoading(
              count: 0,
            ));
          }
          try {
            var coins = await coinRepository.getCoins(event.count);
            prevData.addAll(coins);
            emit(CoinLoaded(
              coins: prevData,
              loading: false,
            ));
          } catch (e) {
            emit(CoinError(e.toString()));
          }
        }
      } catch (e) {
        emit(CoinError(e.toString()));
      }
    });

    on<FetchFromDatabaseData>(fetchFromDatabase);

    on<AddFavouriteData>(addFavourite);

    on<DeleteFavouriteData>(deleteFavourite);
  }

  // fetch data from database
  fetchFromDatabase(FetchFromDatabaseData event, emit) async {
    try {
      emit(CoinFavouriteLoading());
      try {
        var coins = await coinRepository.getCoinsFromDB();
        emit(CoinFavouriteLoaded(coins));
      } catch (e) {
        emit(CoinError(e.toString()));
      }
    } catch (e) {
      emit(CoinError(e.toString()));
    }
  }

  // add favourite data into database
  addFavourite(AddFavouriteData event, emit) async {
    final current = state;
    try {
      try {
        await coinRepository.addFavouriteData(event.coinResponse);
        emit(CoinAddedFavourite());
      } catch (e) {
        emit(CoinError(e.toString()));
      }
    } catch (e) {
      emit(CoinError(e.toString()));
    }
    emit(current);
  }

  // remove favourite data from database
  deleteFavourite(DeleteFavouriteData event, emit) async {
    final current = state;
    try {
      try {
        final coin = await coinRepository.deleteFavouriteData(event.key);
        emit(CoinUnFavourite(coin));
      } catch (e) {
        emit(CoinError(e.toString()));
      }
    } catch (e) {
      emit(CoinError(e.toString()));
    }
    emit(current);
  }
}
