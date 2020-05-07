/// Represents one of the 'possible' correct values of a cell
class Note {

  /// Value of the note in range [1-9]
  final int _value;
  bool _displayed;


  Note(this._value, [this._displayed = false]);

  Note._({int value, bool displayed}): this._displayed = displayed, this._value = value;

  factory Note.fromMap(Map<String, dynamic> json) => Note._(
    value: json["value"] == null ? null : json["value"],
    displayed: json["displayed"] == null ? null : json["displayed"],
  );

  Map<String, dynamic> toMap() => {
    "value": _value == null ? null : _value,
    "displayed": _displayed == null ? null : _displayed,
  };


  /// Getters and setters
  int getValue() => _value;
  bool getDisplayed() => _displayed;
  void setDisplayed(bool displayed) => _displayed = displayed;
}