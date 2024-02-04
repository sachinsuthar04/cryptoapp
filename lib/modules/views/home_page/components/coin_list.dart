import 'package:animate_do/animate_do.dart';
import 'package:cryptoapp/modules/domain/models/coin_response.dart';
import 'package:cryptoapp/themes/colors.dart';
import 'package:flutter/material.dart';

class CoinList extends StatelessWidget {
  const CoinList({super.key, required this.coin, required this.onTap});

  final CoinResponse? coin;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInUp(
          delay: const Duration(milliseconds: 300),
          child: Container(
            color: Colors.teal,
            child: ListTile(
              onTap: onTap,
              title: Text(coin!.name,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      )),
              trailing: Text(
                coin!.symbol,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: AppColors.white),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
