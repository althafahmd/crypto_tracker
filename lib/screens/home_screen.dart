import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/crypto_model.dart';
import '../utilities/app_typography.dart';
import '../utilities/app_colors.dart';
import '../utilities/crypto_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCurrency = currencyList[0];

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currencyList) {
      pickerItems.add(
        Text(
          currency,
          style: AppTypography.labelTextMedium.copyWith(
            color: AppColors.pureWhite,
            fontSize: 30.0,
          ),
        ),
      );
    }

    return CupertinoPicker(
      backgroundColor: AppColors.primaryBG,
      itemExtent: 35.0,
      onSelectedItemChanged: (index) {
        setState(() {
          selectedCurrency = currencyList[index];
          getData();
        });
      },
      children: pickerItems,
    );
  }

  Map<String, String> cryptoRates = {};

  void getData() async {
    Map<String, String> rates = {};
    for (String crypto in cryptoList) {
      try {
        var data = await CryptoModel().getCryptoRate(crypto, selectedCurrency);
        var rate = double.parse(data);
        rates[crypto] = rate.toStringAsFixed(2);
      } catch (e) {
        print(e);
        rates[crypto] = '?';
      }
    }
    setState(() {
      cryptoRates = rates;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Column makeCards() {
    List<CryptoCard> cryptoCards = [];
    for (String crypto in cryptoList) {
      cryptoCards.add(
        CryptoCard(
          cryptoCurrency: crypto,
          selectedCurrency: selectedCurrency,
          value: cryptoRates[crypto] ?? '?',
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cryptoCards,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBG,
        centerTitle: true,
        title: Text(
          'CRYPTO TRACKER',
          style: AppTypography.labelTextMedium.copyWith(
            color: AppColors.pureWhite,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            makeCards(),
            Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: AppColors.primaryBG,
              child: iOSPicker(),
            ),
          ],
        ),
      ),
    );
  }
}
