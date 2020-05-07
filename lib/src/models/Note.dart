import 'dart:async';

/// Represents one of the 'possible' correct values of a cell
class Note {

  /// Value of the note in range [1-9]
  final int _value;

  /// Whether this note would be visible
  bool _displayed;

  StreamController _onChange;


  Note(this._value, [this._displayed = false]){
    _onChange = StreamController.broadcast();
  }

  Note._({int value, bool displayed}): this._displayed = displayed, this._value = value{
    _onChange = new StreamController.broadcast();
  }

  factory Note.fromMap(Map<String, dynamic> json) => Note._(
    value: json["value"] == null ? null : json["value"],
    displayed: json["displayed"] == null ? null : json["displayed"],
  );

  Map<String, dynamic> toMap() => {
    "value": _value == null ? null : _value,
    "displayed": _displayed == null ? null : _displayed,
  };

  /// Toggles the [displayed] property while poking [_onChange]
  void toggleDisplayed() {
    _displayed = !_displayed;
    _onChange.add(this);
  }

  /// Getters and Setters
  int getValue() => _value;
  bool getDisplayed() => _displayed;
  Stream get change => _onChange.stream.asBroadcastStream();

}