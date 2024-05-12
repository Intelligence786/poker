class TypesMapper {
  static TravelType travelTypeParse(String title) {
    switch (title.toLowerCase()) {
      case 'Vacation':
        return TravelType.Vacation;
      case 'Work':
        return TravelType.Work;
      case 'Other':
        return TravelType.Other;
      default:
        throw ArgumentError('Invalid type: $title');
    }
  }
}

enum TravelType { Vacation, Work, Other }

class AnalysisModel {
  final int game;
  final int numberOfOpponents;
  final double sumYourBet;
  final int behaviourStrategy;
  final int betStrategy;
  final int beginningCard;
  final int canYouBluff;
  final int countOfBluff;
  final int determinedOutcome;
  final int outcomeOfThisGame;

  AnalysisModel(
      {this.game = -1,
      this.numberOfOpponents = -1,
      this.sumYourBet = 0.0,
      this.behaviourStrategy = -1,
      this.betStrategy = -1,
      this.beginningCard = -1,
      this.canYouBluff = -1,
      this.countOfBluff = 0,
      this.determinedOutcome = -1,
      this.outcomeOfThisGame = -1});

  // Метод для сериализации в JSON
  Map<String, dynamic> toJson() {
    return {
      'game': game,
      'numberOfOpponents': numberOfOpponents,
      'sumYourBet': sumYourBet,
      'behaviourStrategy': behaviourStrategy,
      'betStrategy': betStrategy,
      'beginningCard': beginningCard,
      'canYouBluff': canYouBluff,
      'countOfBluff': countOfBluff,
      'determinedOutcome': determinedOutcome,
      'outcomeOfThisGame': outcomeOfThisGame,
    };
  }

  // Фабричный метод для создания экземпляра класса из JSON
  factory AnalysisModel.fromJson(Map<String, dynamic> json) {
    return AnalysisModel(
      game: json['game'] ?? -1,
      numberOfOpponents: json['numberOfOpponents'] ?? -1,
      sumYourBet: json['sumYourBet'] ?? 0.0,
      behaviourStrategy: json['behaviourStrategy'] ?? -1,
      betStrategy: json['betStrategy'] ?? -1,
      beginningCard: json['beginningCard'] ?? -1,
      canYouBluff: json['canYouBluff'] ?? -1,
      countOfBluff: json['countOfBluff'] ?? 0,
      determinedOutcome: json['determinedOutcome'] ?? -1,
      outcomeOfThisGame: json['outcomeOfThisGame'] ?? -1,
    );
  }
}

class ResultModel {
  final String title;
  final String description;

  ResultModel({required this.title, required this.description});
}
