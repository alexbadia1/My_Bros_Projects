///File: lymanSeries.dart
///Purpose: To create a Lyman series (whatever that means).
///Input: number to determine series Lyman output
///Original Author: My brother Matthew Badia originally wrote using python
///in the unix command line. He's a chemist, not a programmer (That's where I come in).
///DISCLAIMER: ALL CREDIT goes to my brother who provided me with such calculations.
///I honestly have no idea if they are right.
///Though I do have a basic grasp in college introductory level chemistry, I am by no
///means on the level of my brother. I am just providing a better implementation than what
///my brother did.

class Series {

  //Initializing Rydberg's constant
  static const double RH = 1.097e7;

  //Initializing Plank's constant
  static const double H = 6.626e-34;

  //Initializing c speed of light constant
  static const double C = 2.99e8;

  //Data Field
  int _number;
  int _nInitial;
  int _nFinal;
  List<double> _rawNumber = [];
  List<double> _energy = [];
  List<double> _lambda = [];
  List<double> _frequency = [];

  Series(this._nInitial, this._nFinal, this._energy, this._lambda,
      this._frequency, this._number, this._rawNumber);

  set number(int value) {
    _number = value;
  }

  int get number => _number;

  List<double> get rawNumber => _rawNumber;

  List<double> get frequency => _frequency;

  List<double> get lambda => _lambda;

  List<double> get energy => _energy;

  int get nFinal => _nFinal;

  int get nInitial => _nInitial;


  ///Calculate the lines for the Lyman Series.
  ///Using the Rydberg equation 1/lambda = Rh (1/n1^2 - 1/n2^2)
  ///Where Rh is the Rydberg constant: 1.097e7.
  ///The equation is re-arranged to solve for lambda in nm.
  void calculateLymanSeries () {
    //Set n(initial)
    _nInitial = 1;

    //Setting n(final)
    _nFinal = 1 + _number + 1;

    for (int i = 0; i < _number; i++) {
      //Solving for wavelength, producing a raw_number that mut be converted.
      double raw =  (1.0 / (RH * (1 - 1.0 / ((1 + _number + 1) * (1 + _number + 1)))));
      _rawNumber.add(raw);

      //Converting the raw_number to wavelength in nm.
      _lambda.add(raw * 1.0e9);

      //Calculating frequency by using wavelength in nm using the formula: c/lambda.
      //Where c is the speed of light in a vacuum in meters/seconds.
      //The result is the frequency in l/s or Hz.
      double tempFrequency = C / raw;
      _frequency.add(C / raw);

      //Calculating frequency by using the formula: E = hf,
      //Where h is planks constant.
      //The result is energy in Joules.
      _energy.add(tempFrequency * H);
    } //for
  }//calculateLymanSeries
}//class