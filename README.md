# Magnetic-beam-spin-encoding-NCOMMS-24-03503-
Scripts and data involved in the study of magnetic beam spin encoding (submission - NCOMMS-24-03503)

The files here are split up into the following sections;

1 - Analysis of S(k) signals

    PLEASE NOTE; TO RUN "Experimental_spatial_reconstruction.mlx" CHANGE THE FILEPATH ON LINE 17, AND TO SELECT THE DATASETS; CHANGE
		             WITH THE FILENAME ON LINE 16.

description of script: File takes the input of any of the 'acceptable data inputs' outlined below, and arranges the raw measured signals into S(k).
		         A drift correction is performed to reduce the effect of signal drift due to detector efficiency (outlined in the manuscript) and the data is 
	  	       Fourier transformed to produce the spatial reconstructions given in both figures 3 & 4

  	In order to produce the spatial reconstructions presented please use the following;
		code: "Experimental_spatial_reconstruction.mlx"

		acceptable data inputs:

			% "config_A_007" (no wire obstruction)
			% "config_A_008"
			% "config_A_009"
			% "config_A_010"
			% "config_B_009"
			% "config_B_010"
			% "config_B_011"
			% "config_B_012" (no wire obstruction)




2 - Spin echo measurement

     PLEASE NOTE; TO RUN THE MAIN SCRIPT "read_echo.mlx" YOU WILL REQUIRE THE PRE-REQUISITE PROCEDURES FROM THE "pre_req scripts echo" FOLDER.
	             	  THE FILEPATH ON LINE 7 WILL NEED RE-PATHING.

description of script: File takes in input of current against signal for the variation of B1 and a fixed B2 (as outlined in the manuscript). 
		       A drift correction is made, again to reduce the effect of the detector efficiency drift. (produces the signal presented
		       in figure 3a)




3 - Wire reference measurement

      PLEASE NOTE; THERE ARE 2 SEPERATE FILES FOR PRODUCING BOTH WIRE REFERENCE MEASUREMENTS FOR CONFIGURATION A & B RESPECTIVELY. THE FILEPATH
		               ON LINE 5 WILL NEED RE-PATHING.

description of script: Takes the input of the manually recorded pressure reference measurements (as outlined in the manuscript) along with
		       drift and baseline corrections (produces the black and grey plots in figure 3d).

	in order to produce the wire reference measurement for configuration A please download the following;
		code: "Pressure_ref_measurement_config_A.mlx"
		data: "Config_A_wire_reference_measurement_part_1.mat"
		      "Config_A_wire_reference_measurement_part_2.mat"
		      "Config_A_wire_reference_measurement_part_3.mat"

	in order to produce the wire reference measurement for configuration B please download the following;
		code: "Pressure_ref_measurement_config_B.mlx"
		data: "Config_B_wire_reference_measurement_part_1.mat"
		      "Config_B_wire_reference_measurement_part_2.mat"
	



4 - Signal simulations

	PLEASE NOTE; TO PRODUCE THE FIGURES PRESENTED IN FIG.6 - UN-COMMENT LINE 20, AND COMMENT LINE 21 (I.E. FOR A FIXED MEASUREMENT TIME
		           FOR EACH RESOLUTION)

description of script: Uses exponential contributions from the intensities in rho to produce 2d simulated reconstructions for both; a fixed
		       measurement time, and for an enhanced one.
		

	in order to produce 2d simulated reconstructions for the SMOOTH SPATIAL DISTRIBUTION presented in the manuscript please use;
		code: "comparing_resolutions_2d_rho_smooth.m"

	in order to produce 2d simulated reconstructions for the SHARP SPATIAL DISTRIBUTION presented in the manuscript please use;
		code: "comparing_resolutions_2d_rho_sharp.m"
