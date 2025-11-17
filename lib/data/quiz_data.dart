import 'package:trainer_quiz/models/playstyle.dart';
import 'package:trainer_quiz/models/question.dart';

const int totalQuestions = 20;

final List<Question> quizQuestions = List<Question>.unmodifiable([
  const Question(id: 1, text: 'I like setting the pace early in a match.'),
  const Question(id: 2, text: 'I hate feeling rushed during my turns.'),
  const Question(
    id: 3,
    text: 'I prefer teams with clear, consistent win paths.',
  ),
  const Question(id: 4, text: 'I enjoy winning with creative or spicy tech.'),
  const Question(
    id: 5,
    text: 'I get anxious when I don’t have control of the game.',
  ),
  const Question(
    id: 6,
    text: 'I regularly tweak my team to match the current meta.',
  ),
  const Question(
    id: 7,
    text: 'I make risky reads when behind to catch up fast.',
  ),
  const Question(
    id: 8,
    text: 'I’d rather react to my opponent than force plays.',
  ),
  const Question(
    id: 9,
    text: 'I enjoy building teams more than battling itself.',
  ),
  const Question(
    id: 10,
    text: 'I don’t like practicing unless it feels fun or fresh.',
  ),
  const Question(
    id: 11,
    text: 'I take notes or reflect seriously after events.',
  ),
  const Question(id: 12, text: 'I trust my gut more than what I prepped.'),
  const Question(
    id: 13,
    text: 'I’d rather use a consistent team than a flashy one.',
  ),
  const Question(
    id: 14,
    text: 'I adapt my playstyle based on how I’m feeling that day.',
  ),
  const Question(id: 15, text: 'I feel strongest when I pre-plan my turns.'),
  const Question(
    id: 16,
    text: 'I love pulling off big comebacks with surprise plays.',
  ),
  const Question(
    id: 17,
    text:
        'I stick with teams that feel comfortable, even if they aren’t top meta.',
  ),
  const Question(
    id: 18,
    text: 'I rarely copy meta teams — I like doing my own thing.',
  ),
  const Question(
    id: 19,
    text: 'I perform better when I’m familiar with the team I’m using.',
  ),
  const Question(
    id: 20,
    text: 'I’d rather lose with a unique idea than win playing boring.',
  ),
]);

final Map<TrainerType, Set<int>> trainerScoreMap = {
  TrainerType.general: {1, 3, 5, 7, 9, 11, 13, 15, 17, 20},
  TrainerType.gambler: {1, 4, 6, 7, 10, 12, 14, 16, 18, 20},
  TrainerType.architect: {2, 3, 5, 8, 11, 13, 15, 17, 18, 19},
  TrainerType.flowPlayer: {2, 4, 6, 8, 10, 12, 14, 16, 17, 19},
};

final Map<TrainerType, PlaystyleInfo> playstyleLibrary = {
  TrainerType.gambler: PlaystyleInfo(
    title: 'The Gambler',
    subtitle: 'Aggressive & Flexible',
    strengths: [
      'Great at making reads and punishing habits',
      'Unpredictable and hard to prep for',
      'Explosive damage output when on a roll',
    ],
    weaknesses: [
      'Can overreact and lean too hard into high-risk options',
      'Momentum crashes can snowball fast',
    ],
    growthTip:
        'Layer teams with 1–2 reliable, low-risk plays so you can stabilize when momentum dips.',
  ),
  TrainerType.architect: PlaystyleInfo(
    title: 'The Architect',
    subtitle: 'Passive & Planned',
    strengths: [
      'Controls tempo and dictates the opening turns',
      'Preps specific counters and scouting reports',
      'Confident when executing rehearsed lines',
    ],
    weaknesses: [
      'Struggles when the scripted plan collapses',
      'Can miss surprise outs while forcing the plan',
    ],
    growthTip:
        'Practice backup lines so you can recover fast when opponents knock you off script.',
  ),
  TrainerType.flowPlayer: PlaystyleInfo(
    title: 'The Flow Player',
    subtitle: 'Passive & Flexible',
    strengths: [
      'Calm under pressure and hard to tilt',
      'Adapts well during long sets or best-of series',
      'Reads opponents by watching patterns unfold',
    ],
    weaknesses: [
      'Can hesitate to pressure and gets run over',
      'Risk of drifting without an assertive plan',
    ],
    growthTip:
        'Practice asserting early pressure so you aren’t always reacting to opponents.',
  ),
  TrainerType.general: PlaystyleInfo(
    title: 'The General',
    subtitle: 'Aggressive & Planned',
    strengths: [
      'Consistent, deliberate, and disciplined play',
      'Rarely gives opponents free momentum',
      'Prioritizes clean endgames and inevitability',
    ],
    weaknesses: [
      'May fall behind in tempo wars',
      'Lacks explosive firepower when needed',
    ],
    growthTip:
        'Build proactive plays or tempo spikes into your teams to close games faster.',
  ),
};
