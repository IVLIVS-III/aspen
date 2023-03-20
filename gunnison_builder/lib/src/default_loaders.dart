import 'dart:typed_data';

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:base85/base85.dart';

import '../loader.dart';
import 'default_loaders/css_loader.dart';

class TextLoader implements Loader {
  @override
  Future<String> load(
          LoaderContext ctx, AssetId asset, ConstantReader options) =>
      ctx.buildStep.readAsString(asset);
}

class BinaryLoader implements Loader {
  @override
  Future<String> load(
      LoaderContext ctx, AssetId asset, ConstantReader options) async {
    var bytes = List<int>.from(await ctx.buildStep.readAsBytes(asset));
    var padding = bytes.length % 4;
    if (padding == 0) {
      padding = 4;
    }

    bytes.addAll(List<int>.filled(padding - 1, 0));
    bytes.add(padding);

    var codec = Base85Codec(Alphabets.z85);
    var encoded = codec.encode(bytes as Uint8List);
    return Future<String>.value(encoded);
  }
}

final defaultLoaders = <String, Loader Function()>{
  'TextLoader': () => TextLoader(),
  'BinaryLoader': () => BinaryLoader(),
  'CssLoader': () => CssLoader(),
};
