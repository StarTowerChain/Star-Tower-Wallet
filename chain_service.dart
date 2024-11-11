import 'package:bip39/bip39.dart' as bip39;
import 'package:hd_wallet/chain_service/base_service.dart';
import 'package:hd_wallet/config/enum_config.dart';

import 'btc_service.dart';
import 'eth_service.dart';
import 'trx_service.dart';

class ChainService {
  static final EthService _ethService = EthService();
  static final EthService _bscService = EthService();
  static final EthService _demonService = EthService();
  static final TrxService _trxService = TrxService();
  static final BtcService _btcService = BtcService();

  static EthService ethService = _ethService;
  static EthService bscService = _bscService;
  static EthService demonService = _demonService;
  static TrxService trxService = _trxService;
  static BtcService btcService = _btcService;

  static void init() {
    var api_key =
        '2c647b20-d9ce-4f08-8f28-81acad86549d'; //'d33c0464-ea79-47e4-86cd-3fa44617f40c';

    _ethService.init('https://eth-blockbook.nownodes.io',
        'https://eth.nownodes.io/$api_key', api_key);

    _bscService.init('https://bsc-blockbook.nownodes.io',
        'https://bsc.nownodes.io/$api_key', api_key);

    _trxService.init('https://api.trongrid.io', 'https://api.trongrid.io');
    _btcService.init('https://btc-blockbook.nownodes.io',
        'http://btc:btc2019@49.0.248.135:8333', api_key);
    // _demonService.init(
    //     'https://bsc.nownodes.io/d33c0464-ea79-47e4-86cd-3fa44617f40c',
    //     'https://bsc.nownodes.io/d33c0464-ea79-47e4-86cd-3fa44617f40c',
    //     'd33c0464-ea79-47e4-86cd-3fa44617f40c');
    _demonService.init(
        'https://scan.demonchain.io/', 'https://rpc1.demonchain.io', '');
  }

  static BaseService getService(CoinEnum coinEnum) {
    if (coinEnum.name.toUpperCase() == 'ETH') {
      return _ethService;
    } else if (coinEnum.name.toUpperCase() == 'TRX') {
      return _trxService;
    } else if (coinEnum.name.toUpperCase() == 'BTC') {
      return _btcService;
    } else if (coinEnum.name.toUpperCase() == 'BSC') {
      return _bscService;
    } else if (coinEnum.name.toUpperCase() == 'DEMON') {
      return _demonService;
    } else {
      return _ethService;
    }
  }

  // 助记词生成
  static String generateMnemonic() {
    return bip39.generateMnemonic();
  }

  static bool validateMnemonic(String mnemonic) {
    return bip39.validateMnemonic(mnemonic);
  }
}
