extension ConvertType on String {
  String convertType() {
    if (this == 'whatever') {
      return '';
    } else {
      return this;
    }
  }
}

extension GetPlural on int {
  String getPlural() {
    if (this > 1) {
      return 'people';
    } else {
      return 'person';
    }
  }
}
