# cryptoapp

Cryptocurrencies App

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)


Following are the project architecture setup,

## Developer

Name: Sachin Suthar

Email: sutharsachin90@yahoo.in

Phone Number: [+91-9510981420](tel:+919510981420)

LinkedIn: [SACHIN SUTHAR](https://www.linkedin.com/in/sutharsachin/)

## Packages

- [Go Router](https://pub.dev/packages/go_router) ^12.1.1
- [Bloc](https://pub.dev/packages/bloc) ^8.1.2
- [Flutter Bloc](https://pub.dev/packages/flutter_bloc) ^8.1.3
- [Equatable](https://pub.dev/packages/equatable) ^2.0.5
- [Hive](https://pub.dev/packages/hive_flutter/versions) ^1.1.0
- [hive_flutter](https://pub.dev/packages/hive) ^2.2.3
- [Path Provider](https://pub.dev/packages/path_provider) ^2.1.1
- [Connectivity_plus](https://pub.dev/packages/connectivity_plus) ^4.0.1
- [intl](https://pub.dev/packages/intl) ^0.18.1


## Architecture Pattern

### BLoC

The architecture pattern used in this demo is `BLOC`. Where, there is 1 BLoC responsible for
functioning of the application.

- [CoinBloc](.lib/modules/bloc/coin_bloc.dart) - For Handling list of data

### Repository

- [CoinRepository](.lib/modules/repositories/coin_repository.dart)

    - We add operation for fetch data from API
    - CRUD operation manage HIVE data base


Note: Following `Module based development` to scale to larger module structure

