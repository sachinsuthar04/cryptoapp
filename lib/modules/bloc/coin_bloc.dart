import 'package:bloc/bloc.dart';
import 'package:cryptoapp/modules/domain/models/coin_response.dart';
import 'package:cryptoapp/modules/repositories/coin_repository.dart';
import 'package:meta/meta.dart';

part 'coin_event.dart';
part 'coin_state.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  final CoinRepository coinRepository = CoinRepository();

  CoinBloc(CoinRepository coinRepository)
      : super(
          CoinInitial(),
        ) {
    on<CoinEvent>((event, emit) async {
      try {
        if (event is FetchCoinData) {
          emit(CoinLoading());

          try {
            var coins = await coinRepository.getCoins();
            emit(CoinLoaded(coins));
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
