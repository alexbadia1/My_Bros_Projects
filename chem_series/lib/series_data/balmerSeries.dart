///File: balmerSeries.dart
///Purpose: To create a Balmer series (whatever that means).
///Input: number to determine series Balmer output
///Original Author: My brother Matthew Badia originally wrote using python
///in the unix command line. He's a chemist, not a programmer (That's where I come in).
///DISCLAIMER: ALL CREDIT goes to my brother who provided me with such calculations.
///I honestly have no idea if they are right.
///Though I do have a basic grasp in college introductory level chemistry, I am by no
///means on the level of my brother. I am just providing a better implementation than what
///my brother did.
import 'package:chemseries/series_data/serie.dart';

class BalmerSeries extends Series {

  BalmerSeries(int newNumber) : super(newNumber);

  ///Calculate the lines for the Balmer Series.
  ///Using the Rydberg equation 1/lambda = Rh (1/n1^2 - 1/n2^2)
  ///Where Rh is the Rydberg constant: 1.097e7.
  ///The equation is re-arranged to solve for lambda in nm.
  void calculateBalmerSeries () {
    //Set n(initial)
    nInitial = 2;
    //Setting n(final)
    nFinal = 2 + number + 1;

    for (int i = 0; i < number; i++) {
      //Solving for wavelength, producing a raw_number that mut be converted.
      //Using the formula: 1/a - 1/((a + b + 1) (a + b +1)) the spectra form can be calculated
      double raw = (1.0 / (Series.RH * (0.25 - (1.0 / ((2 + i + 1) * (2 + i + 1))))));
      rawNumber.add(raw);

      //Converting the raw_number to wavelength in nm.
      lambda.add(raw * 1.0e9);

      //Calculating frequency by using wavelength in nm using the formula: c/lambda.
      //Where c is the speed of light in a vacuum in meters/seconds.
      //The result is the frequency in l/s or Hz.
      double tempFrequency = Series.C / raw;
      frequency.add(Series.C / raw);

      //Calculating frequency by using the formula: E = hf,
      //Where h is planks constant.
      //The result is energy in Joules.
      energy.add(tempFrequency * Series.H);

      currentN.add(i);
    } //for
  }//calculateBalmerSeries
}//class