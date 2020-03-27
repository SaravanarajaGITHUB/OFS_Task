import 'package:flutter/foundation.dart';
import 'package:ofs_task/presentation/view_model/view_state.dart';

abstract class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => this._state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
