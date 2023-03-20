// import 'package:gunnison_assets/gunnison_assets.dart' as gunnison;
// import 'dart:html';

import 'package:gunnison_playground/assets.dart';
import 'package:gunnison_web/gunnison_web.dart';

void main() {
  JsAsset(text: 'console.log("loading...")')
      .evalAsync()
      .then((_) => print('evalAsync done'));
  print('after evalAsync');

  jqueryReadme.text.substring(0);
  jquery.eval();
  icons.apply();

  // print(ascii.decode(bowerBinary.decode().toList()));
  octicons.json();
  // print(octicons.json());
}
