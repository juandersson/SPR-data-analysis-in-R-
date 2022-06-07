# SPR-data-analysis-in-R-
# Description 
This repository provides curve fitting routines for SPR data analysis in R. It was developed and used for my Bachelor’s thesis. The repository contains a set of R scripts as well as simulated data. 

# Usage 
Note: The R scripts contain code that is set up to model simulated data (available in the “Simulated data” folder) and should be specified to the data being analysed.  

  •	The R script “Association phase curve fitting” is used on SPR association phase data to obtain the constants Beq (binding at equilibrium) and kobs (observed     association rate constant). 
  
  •	The R script “Dissociation phase curve fitting” is used on SPR dissociation phase data to obtain the dissociation rate constants. 
  
  •	Beq and kobs values derived for a range of analyte concentrations are used to derive the KD (dissociation constant), using the R scripts “Equilibrium analysis” and “kobs against con”.   

# References 
Hoare SRJ. Analyzing Kinetic Binding Data. In: Markossian S, Grossman A, Brimacombe K, et al., editors. [Internet]. Bethesda, MD: Eli Lilly & Company and the National Center for Advancing Translational Sciences; 2004-. [cited 2022 June 7]. Available from: https://www.ncbi.nlm.nih.gov/books/NBK53196/ 

Schasfoort RBM. Introduction to Surface Plasmon Resonance. In: Schasfoort RBM, editor. Handbook of Surface Plasmon Resonance. 2. ed. Enschede: The Royal Society of Chemistry; 2017. p. 1-26. 
