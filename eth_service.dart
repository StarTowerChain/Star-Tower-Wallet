import 'dart:typed_data';

import 'package:hd_wallet/chain_service/base_service.dart';
import 'package:hd_wallet/chain_service/chain_service.dart';
import 'package:hd_wallet_plugin/hd_wallet_plugin.dart';
import 'package:hd_wallet_plugin/wallet/model/index.dart';
import 'package:hd_wallet/serviceApi/chain_api.dart';

class EthService implements BaseService {
  late EtherWallet wallet;

  init(String apiUri, String rpc, [String? apiKey]) {
    wallet = EtherWallet(rpcUrl: rpc, apiUrl: apiUri, apiKey: apiKey ?? '');
  }

  Future<HdWallet> decryptKs(
      {required String ks, required String password}) async {
    return wallet.decryptKs(ks: ks, password: password);
  }

  Future<String> encryptKs(
      {required String privateKey, required String password}) async {
    return wallet.encryptKs(privateKey: privateKey, password: password);
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
  Future<HdWallet> generateHDWallet() async {
    String mnemonic = ChainService.generateMnemonic();
    return wallet.deriveChildWallet(mnemonic: mnemonic);
  }

  @override
  Future<BigInt> balance(String address) async {
    return wallet.balance(address);
  }

  @override
  Future<List<AddressToken>> addressTokens(String address) {
    return wallet.addressTokens(address);
  }

  @override
  Future<HdWallet> deriveChildWallet(
      {required String mnemonic, int index = 0}) {
    return wallet.deriveChildWallet(mnemonic: mnemonic, index: index);
  }

  @override
  Future<String> send(
      {required String privateKey,
      required String to,
      required BigInt amount,
      BigInt? fee,
      Uint8List? data}) {
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
    return wallet.sendToken(
        privateKey: privateKey,
        to: to,
        amount: amount,
        tokenAddress: tokenAddress,
        fee: fee);
  }

  @override
  int getDecimals() {
    return wallet.decimals;
  }

  @override
  Future<BigInt> tokenBalance(
      {required String address, required String token}) async {
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
