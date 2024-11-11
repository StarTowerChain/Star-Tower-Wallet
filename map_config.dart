import 'dart:ui';

import 'package:hd_wallet/config/enum_config.dart';
import 'package:hd_wallet_plugin/wallet/model/index.dart';

final Map<String, CoinEnum> coinMap = {
  'eth': CoinEnum.eth,
  'btc': CoinEnum.btc,
  'trx': CoinEnum.trx,
  'bnb': CoinEnum.bsc,
  'bsc': CoinEnum.bsc,
  'demon': CoinEnum.demon,
};

final Map<TransactionStatus, String> transactionStatusMap = {
  TransactionStatus.success: 'u66',
  TransactionStatus.fail: 'u67',
  TransactionStatus.pending: 'u68',
};

final Map<TransactionStatus, Color> transactionColorMap = {
  TransactionStatus.success: const Color(0xff40AD8E),
  TransactionStatus.fail: const Color(0xffD1514B),
  TransactionStatus.pending: const Color(0xffD1514B),
};
