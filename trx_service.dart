import 'dart:typed_data';

import 'package:hd_wallet/chain_service/base_service.dart';
import 'package:hd_wallet/chain_service/chain_service.dart';
import 'package:hd_wallet_plugin/ethereum/index.dart';
import 'package:hd_wallet_plugin/tron/index.dart';
import 'package:hd_wallet_plugin/wallet/model/address_token.dart';
import 'package:hd_wallet_plugin/wallet/model/block_transaction.dart';
import 'package:hd_wallet_plugin/wallet/model/hd_wallet.dart';

class TrxService implements BaseService {
  late TronWallet wallet;

  init(String apiUri, String rpc) {
    wallet = TronWallet(rpcUrl: rpc, apiUrl: apiUri);
  }

  @override
  Future<List<AddressToken>> addressTokens(String address) {
    return wallet.addressTokens(address);
  }

  @override
  Future<BigInt> balance(String address) {
    return wallet.balance(address);
  }

  @override
  Future<HdWallet> deriveChildWallet(
      {required String mnemonic, int index = 0}) {
    return wallet.deriveChildWallet(mnemonic: mnemonic, index: index);
  }

  @override
  Future<HdWallet> generateHDWallet() {
    String mnemonic = ChainService.generateMnemonic();
    return wallet.deriveChildWallet(mnemonic: mnemonic);
  }

  @override
  int getDecimals() {
    return wallet.decimals;
  }

  @override
  Future<HdWallet> generateWalletFromMnemonic(String mnemonic) async {
     return wallet.deriveChildWallet(mnemonic: mnemonic);
  }

  @override
  Future<String> publicAddressFromPrivate(String privateKey) {
    return wallet.publicAddressFromPrivate(privateKey);
  }

  @override
  Future<String> send(
      {required String privateKey,
      required String to,
      required BigInt amount,
      BigInt? fee,
      Uint8List? data}) {
    Map _data = {
      'privateKey': privateKey,
      'to': to,
      'amount': amount,
      'fee': fee,
      'data': data,
    };
    print('send+++++');
    print(_data.toString());
    return wallet.send(
        privateKey: privateKey, to: to, amount: amount, fee: fee, data: data);
  }

  @override
  Future<String> sendToken(
      {required String privateKey,
      required String to,
      required BigInt amount,
      required String tokenAddress,
      BigInt? fee}) {
    Map _data = {
      'privateKey': privateKey,
      'to': to,
      'amount': amount,
      'fee': fee,
      'tokenAddress': tokenAddress,
    };
    print('sendToken+++++');
    print(_data.toString());
    return wallet.sendToken(
        privateKey: privateKey,
        to: to,
        amount: amount,
        tokenAddress: tokenAddress,
        fee: fee);
  }

  @override
  Future<BigInt> tokenBalance(
      {required String address, required String token}) {
    return wallet.tokenBalance(address: address, token: token);
  }

  @override
  Future<TokenDetail> tokenDetail(String tokenAddress) {
    return wallet.tokenDetail(tokenAddress);
  }

  @override
  Future<List<BlockTransaction>> transactions(
      {required String address,
      int page = 1,
      int pageSize = 10,
      String contract = '',
      String fingerprint = ''}) {
    return wallet.transactions(
        address: address,
        page: page,
        pageSize: pageSize,
        contract: contract,
        fingerprint: fingerprint);
  }
}
