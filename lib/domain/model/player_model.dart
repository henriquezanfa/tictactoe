class Player {
  final String name;

  int get score => _score;

  int _score;

  Player(
    this.name, {
    int initialScore = 0,
  }) : _score = initialScore;

  void incrementScore() {
    _score++;
  }
}
