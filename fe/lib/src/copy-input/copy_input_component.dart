import 'dart:html';

import 'package:angular/angular.dart';

@Component(
  selector: 'copy-input',
  templateUrl: 'copy_input_component.html',
  styleUrls: ['copy_input_component.css'],
  directives: [NgIf, TemplateRef],
)
class CopyInput {
  @Input()
  bool disabled = true;

  @Input()
  String link = '';

  bool get linkValid => link.isNotEmpty;

  void handleCopy(InputElement input) {
    input.disabled = false;
    input.select();
    document.execCommand('copy');
    input.setSelectionRange(0, 0);
    input.disabled = disabled;
  }
}
