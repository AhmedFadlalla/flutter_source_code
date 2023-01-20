abstract class counterStates {}

class initState extends counterStates{}
class plusState extends counterStates{
   final int counter;
   plusState(this.counter);

}
class minusState extends counterStates{
  final int counter;
  minusState(this.counter);
}