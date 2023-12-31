import 'package:schedule_app/models/class_model.dart';

List<BlockSchedule> dwightschedules = [
// 11 grade schedule
  BlockSchedule('11grade', [
    // day 1
    // ABC-DEF
    BlockDay(
        'day 1', ['ablock', 'bblock', 'cblock', 'dblock', 'eblock', 'fblock']),
    // day 2
    // GHI-ABC
    BlockDay(
        'day 2', ['gblock', 'hblock', 'iblock', 'ablock', 'bblock', 'cblock']),

    // day 3
    // DEF-GHI
    BlockDay(
        'day 3', ['dblock', 'eblock', 'fblock', 'gblock', 'hblock', 'iblock']),

    // day 4
    // ABC-DEF
    BlockDay(
        'day 4', ['ablock', 'bblock', 'cblock', 'dblock', 'eblock', 'fblock']),

    // day 5
    // GHI-ABC
    BlockDay(
        'day 5', ['gblock', 'hblock', 'iblock', 'ablock', 'bblock', 'cblock']),

    // day 6
    // DEF-GHI
    BlockDay(
        'day 6', ['dblock', 'eblock', 'fblock', 'gblock', 'hblock', 'iblock'])
  ])
//  12 grade schedule...
];
