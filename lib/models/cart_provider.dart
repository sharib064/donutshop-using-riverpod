import 'package:donutapp/models/donut.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends Notifier<List<Donut>> {
  @override
  List<Donut> build() {
    return [];
  }

  void addDonut(Donut donut) {
    state = [...state, donut];
  }

  void removeDonut(Donut donut) {
    state = state.where((element) => element != donut).toList();
  }
}

final cartNotifierProvider = NotifierProvider<CartNotifier, List<Donut>>(
  () {
    return CartNotifier();
  },
);
