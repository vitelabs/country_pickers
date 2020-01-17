import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Country {
  final String nameEn;
  final String isoCode;
  final String phoneCode;
  final String nameZh;


  bool isZh = false;
  String name(BuildContext context) {
    if (Localizations.localeOf(context).languageCode == "zh") {
      return this.nameZh;
    }
    return nameEn;
  }

  Country({this.isoCode, this.phoneCode, this.nameEn,this.nameZh});
  factory Country.fromMap(Map<String, String> map) => Country(
        nameEn: map['nameEn'],
        isoCode: map['isoCode'],
        phoneCode: map['phoneCode'],
        nameZh: map['nameZh']
      );
  static Country of(BuildContext context) {
//    Localizations.localeOf(context).countryCode
    return Localizations.of<Country>(context, Country);
  }
}

//class CountryDelegate extends LocalizationsDelegate<Country> {
//  const CountryDelegate();
//
//  //是否支持某个Local
//  @override
//  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);
//
//  // Flutter会调用此类加载相应的Locale资源类
//  @override
//  Future<Country> load(Locale locale) {
//    return SynchronousFuture<Country>(
//        Country(locale.languageCode == "zh")
//    );
//  }
//
//  @override
//  bool shouldReload(CountryDelegate old) => false;
//}