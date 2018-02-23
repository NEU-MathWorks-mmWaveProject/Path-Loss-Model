/*************************************************************************************

  Project Name:		Path Loss Modelling
  File Name:		Readme_PathLoss.txt
  Authors:		Miead Tehrani-Moayyed
  Version:		1.0
  History:		Feb 2018 created
  Email:		tehranimoayyed.m@husky.neu.edu
*************************************************************************************
  Description:
 
  The purpose of this project is to provide a path loss model for mmWave transmissions
  in a use-case scenario of your choice.  Thus, this folder provides a Matlab function
  and an example of using it.

  The "pathLossModel.m" function generates the parameters used in the path loss model,
  which is based on an equation widely used in research literature - see equation (2)
  in the attached paper ("Investigation of Prediction Accuracy, Sensitivity, and
  Parameter Stability of Large-Scale Propagation Path Loss Models for 5G Wireless
  Communications").

  The example file "examplePLModel.m" shows how the Matlab function can be used in
  conjunction with few input files delivered in this package.

*******************************
  Matlab Function Description:

  The function extracts the statistics of the path loss values (provided as inputs),
  and generates the parameters (path loss exponent and shadowing factor) required for
  the path loss model we use.

  The only input requirement is a ".mat" file that contains the path loss values for
  the considered use-case scenario.  These path loss values can be obtained via
  measurements using channel sounders and various antennas, or can be estimated with
  a ray tracer.  The data organization in the path loss input files is described
  in the header portion of the "pathLossModel.m" Matlab function.

  The function also plots the path loss values and the curves for the model we use, as
  soon as it extracts the path loss exponent and the standard deviation of the shadowing
  factor.  A secondary plot shows the distribution of path loss values that represents
  the mechanism of estimating the shadowing factor value.


*******************************
  Example Description:
  
  The "examplePLModel.m" file shows how we can use the "pathLossModel.m" Matlab function
  by applying it to the two input files that are delivered in this folder, one for an
  indoor study and one for an outdoor case.  These input files contain path loss values
  obtained with the "Wireless InSite" ray tracer by Remcom.

  The "PL model" folder contains 3 path loss files for the indoor scenario and 4 files
  for the outdoor scenario.  The indoor scenario refers to a customizable conference room
  in which we can remove furniture and electronic equipment; hence, the names
  "complex," "semicomplex," and "simple."  The outdoor Vehicular-to-Infrastructure (V2I)
  NLOS communications scenario is based on two types of horn antennas and a constantly
  aligning mechanism between Tx and Rx antenna beams. Simple changes in the code of the
  "examplePLModel.m" file allows the user to select any of the 3 path loss input files
  for the indoor scenario and any of the 4 similar files for the outdoor scenario.

  The user can also generate his/her own path loss files for the application of his/her
  choice.  These files would be read and processed with the same "examplePLModel.m" file
  by changing the code to call for the appropriate input file names.

	
*************************************************************************************/

   

  
