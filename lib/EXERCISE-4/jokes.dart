
class Joke {
  final String title;
  final String description;

  Joke({required this.title, required this.description});
}
List<Joke> jokes = List.generate(
  20,
  (index) => Joke(
    title: "Joke ${index + 1}",
    description: "This is the description for joke ${index + 1}.",
  ),
);
