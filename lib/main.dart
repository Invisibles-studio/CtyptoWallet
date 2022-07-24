import 'package:crypto_wallet/Activities/WalletSetupWelcome.dart';
import 'package:flutter/material.dart';
import 'package:crypto_wallet/Activities/StartScreen.dart';

void main() => runApp(MaterialApp(
  initialRoute: "/",
  routes: {
    "/": (context) => StartScreen(),
    "/WalletSetupWelcome": (context) => WalletSetupWelcome(),
  },
));
