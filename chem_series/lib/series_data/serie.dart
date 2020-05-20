class Series {

  //Initializing Rydberg's constant
  static const double RH = 1.097e7;

  //Initializing Plank's constant
  static const double H = 6.626e-34;

  //Initializing c speed of light constant
  static const double C = 2.99e8;

  //Data Field
  int number;
  int nInitial;
  int nFinal;
  List<int> currentN = [];
  List<double> rawNumber = [];
  List<double> energy = [];
  List<double> lambda = [];
  List<double> frequency = [];

  Series(this.number);

  set getNumber(int value) {
    number = value;
  }

  List<int> get getCurrentN => currentN;

  int get getNumber => number;

  List<double> get getRawNumber => rawNumber;

  List<double> get getFrequency => frequency;

  List<double> get getLambda => lambda;

  List<double> get getEnergy => energy;

  int get getnFinal => nFinal;

  int get getnInitial => nInitial;
}