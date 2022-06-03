import 'dart:async';
import 'package:angular/angular.dart';
import 'package:fe/src/card/card_component.dart';

@Component(
  selector: 'fail-card',
  templateUrl: 'fail_card_component.html',
  styleUrls: ['fail_card_component.css'],
  directives: [Card],
)
class FailCard {
  final _resetEvt = StreamController<bool>();
  @Output()
  Stream<bool> get reset => _resetEvt.stream;

  void doReset() {
    _resetEvt.add(true);
  }
}
