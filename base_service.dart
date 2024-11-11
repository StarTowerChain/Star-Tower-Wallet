import 'dart:typed_data';

import 'package:hd_wallet_plugin/wallet/model/index.dart';

abstract class BaseService {
  int getDecimals();

  Future<HdWallet> generateWalletFromMnemonic(String mnemonic);

  Future<String> publicAddressFromPrivate(String privateKey);

  Future<HdWallet> generateHDWallet();

  Future<BigInt> balance(String address);

  Future<BigInt> tokenBalance({required String address, required String token});

  Future<List<AddressToken>> addressTokens(String address);

  Future<HdWallet> deriveChildWallet({required String mnemonic, int index = 0});

  Future<TokenDetail> tokenDetail(String tokenAddress);

  //查询地址交易信息列表
  Future<List<BlockTransaction>> transactions({
    required String address,
    int page = 1,
    int pageSize = 10,
    String contract = '',
    String fingerprint = '',
  });

  //发送
  Future<String> send({
    required String privateKey,
    required String to,
    required BigInt amount,
    BigInt? fee,
    Uint8List? data,
  });

  //发送代币
  Future<String> sendToken({
    required String privateKey,
    required String to,
    required BigInt amount,
    required String tokenAddress,
    BigInt? fee,
  });
}
