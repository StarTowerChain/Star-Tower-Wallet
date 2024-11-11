import 'package:flutter/material.dart';
import 'package:hd_wallet/chain_service/base_service.dart';
import 'package:hd_wallet/chain_service/chain_service.dart';
import 'package:hd_wallet/config/map_config.dart';
import 'package:hd_wallet/ui/view/wallet/keystore/config.dart';
import 'package:hd_wallet_plugin/wallet/model/hd_wallet.dart';
import 'package:bip39/bip39.dart' as bip39;

class GenWalletArg {
  final String mnemonic;
  final String chain;
  final int? index;

  GenWalletArg({required this.mnemonic, required this.chain, this.index});
}

class ComputeMethods {
  static Future<String> generateKs(KeystoreArg keystoreArg) async {
    ChainService.init();
    String ks = await ChainService.ethService.encryptKs(
        privateKey: keystoreArg.privateKey, password: keystoreArg.password);
    return ks;
  }

  static Future<String> generateMnemonic(int? strength) async {
    return bip39.generateMnemonic();
  }

  // static Future<HdWallet> deriveChildWallet(GenWalletArg data) async {
  //   ChainService.init();
  //   BaseService service =
  //       ChainService.getService(coinMap[data.chain.toLowerCase()]!);
  //   return service.deriveChildWallet(
  //       mnemonic: data.mnemonic, index: data.index ?? 0);
  // }

  // static Future<HdWallet> generateWalletFromMnemonic(GenWalletArg data) async {
  //   ChainService.init();
  //   BaseService service =
  //       ChainService.getService(coinMap[data.chain.toLowerCase()]!);
  //   return service.generateWalletFromMnemonic(data.mnemonic);
  // }
}
