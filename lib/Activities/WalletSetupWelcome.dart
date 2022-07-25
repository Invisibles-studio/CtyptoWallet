import 'package:crypto_wallet/CustomComponents/GradientButton.dart';
import 'package:crypto_wallet/CustomComponents/GradientText.dart';
import 'package:crypto_wallet/CustomComponents/RoundedButton.dart';
import 'package:flutter/material.dart';

import '../Colors.dart';

class WalletSetupWelcome extends StatefulWidget {
  const WalletSetupWelcome({Key? key}) : super(key: key);

  @override
  State<WalletSetupWelcome> createState() => _WalletSetupWelcomeState();
}

class _WalletSetupWelcomeState extends State<WalletSetupWelcome> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.backgroundMain,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 165)),
                const Image(image: AssetImage('assets/images/walletSetup.png')),
                const Padding(padding: EdgeInsets.only(top: 71)),
                const Text("Wallet Setup", style: TextStyle(
                  fontFamily: 'Archivo',
                  color: Colors.white,
                  fontSize: 40,
                ),),
                const Padding(padding: EdgeInsets.only(top: 36)),
                RoundedButton(() { }, const Text("Import Using Seed Phrase", style: TextStyle(
                  fontFamily: 'Archivo',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),),
                  radius: const BorderRadius.all(Radius.circular(168)),
                  color: ProjectColors.gray21,
                  height: 56,
                  width: MediaQuery.of(context).size.width-48,
                ),
                const Padding(padding: EdgeInsets.only(top: 16)),
                GradientButton(() { }, const Text("Create a New Wallet", style: const TextStyle(
                    fontFamily: 'Archivo',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),), ProjectColors.startScreenGradient, borderRadius: BorderRadius.circular(168),
                  height: 56,
                  width: MediaQuery.of(context).size.width-48,)

            ],)
          ],
        ),
      ),
    );
  }
}
