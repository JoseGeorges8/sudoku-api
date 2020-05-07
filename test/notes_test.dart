import 'package:flutter_test/flutter_test.dart';
import 'package:sudoku_api/sudoku_api.dart';

void main() async {
  final PuzzleOptions puzzleOptions = PuzzleOptions(patternName: "winter", name: "options test");
  final Puzzle puzzle = Puzzle(puzzleOptions);
  await puzzle.generate();

  String serializationTestTitle01 = 'Test all notes have been created as expected';
  test(serializationTestTitle01, () {

    for(int i = 0; i<9;i++){
      puzzle.board().getRow(i).forEach((cell) {
        for(int i = 0; i < cell.getNotes().length; i++){
          expect(cell.getNotes()[i].getValue(), i+1);
          expect(cell.getNotes()[i].getDisplayed(), false);
        }
      });
    }

  });


  String serializationTestTitle02 = 'Test setDisplayed of note';
  test(serializationTestTitle02, () {

    for(int i = 0; i<9;i++){
      puzzle.board().getRow(i).forEach((cell) {
        for(int i = 0; i < cell.getNotes().length; i++){
          expect(cell.getNotes()[i].getValue(), i+1);
          cell.getNotes()[i].setDisplayed(true);
          expect(cell.getNotes()[i].getDisplayed(), true);
        }
      });
    }

  });


}