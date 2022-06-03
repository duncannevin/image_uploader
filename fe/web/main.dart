import 'package:angular/angular.dart';
import 'package:ngcomponents/angular_components.dart';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';
import 'package:fe/app_component.template.dart' as ng;

import 'main.template.dart' as self;

// Example of a [root injector](https://angulardart.xyz/guide/dependency-injection#root-injector-providers)
// [popupModule] is used in [MaterialTooltipDirective]
@GenerateInjector([ClassProvider(Client, useClass: BrowserClient), popupModule,])
final InjectorFactory rootInjector = self.rootInjector$Injector;

void main() {
  runApp(ng.AppComponentNgFactory, createInjector: rootInjector);
}
