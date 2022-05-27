import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';

@Component(
  selector: 'choose-file',
  templateUrl: 'choose_file_component.html',
  styleUrls: ['choose_file_component.css'],
)
class ChooseFile {
  final _fileEvt = StreamController<File>();
  @Output()
  Stream<File> get file => _fileEvt.stream;

  void fileSelected(List<File> files) {
    if (files.length == 1) {
      _fileEvt.add(files[0]);
    }
  }
}
