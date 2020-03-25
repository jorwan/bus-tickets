import 'ivalidatable.dart';

class TicketMatchesWithExpectedDataValidator implements IValidatable {
  IValidatable validator;
  List<dynamic> expectedData;
  List<dynamic> sourceData;

  @override
  TicketMatchesWithExpectedDataValidator(this.sourceData, this.expectedData,
      {this.validator}) {
    this.validator ??= Validatable();
  }

  @override
  bool valid() {
    bool isMatched = this.sourceData.toString() == this.expectedData.toString();
    return isMatched && this.validator.valid();
  }
}
