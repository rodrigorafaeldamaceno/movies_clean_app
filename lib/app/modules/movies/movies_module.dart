import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/movies_page.dart';

class MoviesModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const MoviesPage());
  }
}
