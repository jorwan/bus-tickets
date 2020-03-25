abstract class IValidatable {
  bool valid();
}

class Validatable implements IValidatable {
  bool Function() predicate;

  Validatable({this.predicate}) {
    this.predicate ??= () => true;
  }

  @override
  bool valid() => this.predicate();
}
