# Thesis_Giacomo_Giacomelli

This repository contains the following items:

# Common

Fiji macro 1 (Binary Mask):
- Input: Bright field/Phase contrast image
- Output: Binary Mask (scaled 10 times, bicubic interpolation)
- Output format: .tif , .txt  

Fiji macro 2 (Watershed):
- Input: Binary Mask (.tif)
- Manual input required: Select area that needs watersheding
- Output: Binary Mask, selected area changes to watersheded version (Can be applied multiple times to different areas within the binary mask - used to segmentate cells)
- Output format: Requires manual save once satisfied with manual changes (.tif) 

Fiji macro 3:
- Input: Binary Mask (.tif)
- Manual Input required: Add ROIs of interest to ROI manager (Wand tool) (Save the list of ROIs as .zip before proceeding)
- Requirements: a folder named "Cells" within the working directory
- Output: Cell*.txt (it outputs in "Cells" a single file for each ROI listed within the ROI manager)

Script_R1_ROI_mod (ROI modification script):
- Input: ROIs obtained via Fiji macro 3 -> need to be named Cell*.txt
- Output: ROIs ready to be used for "Script_R2_Filtering" script -> R.Cell*.txt

Script_R2_Filtering:
- Input 1: Output from Script_R1_ROI_mod
- Input 2: PALM_Table_Example.txt
- Output 1: ROIs list for R ("AreaListX.RData")
- Output 2: Filtered + Aligned + CellName + CellDiameter + CellArea (Channel_#_updatedtableX.txt)
- Output 3: Filtered + Aligned + ROIexclusive + CellName + CellDiameter + CellArea (Channel_#_cells_drifted_filtered.txt)
- Output 4: Filtered + Aligned + ROIexclusive (can be imported in ZenBlack) (Channel_#_cells_drifted_filtered_IMG.txt)

# Conventional-like analysis

- Channel_#_cells_drifted_filtered_IMG.txt can be imported in ZenBlack and shown as Gaussian rendering, ... 
- Generally, SMLM data tables can be imported in the Fiji plugin ThunderSTORM (M. Ovesný et al. 2014) and rendered as Normalized Gaussian, Histograms and other rendering variants. The resulting rendering can be used for conventional-like analysis (ThunderSTORM Import Header: id, frame,	x [nm],	y [nm],	sigma [nm],	intensity [photon],	offset [photon],	bkgstd [photon],	chi2,	uncertainty_xy [nm])

Fiji_Macro_4:_Profiling (Works on any rendering)
- Input: DualChannel_8/16/32-bit_.tif (Channel1-> histograms, Channel2-> bright field)
- Requirements 1: A folder named "Profiles" within the same folder of the Input image
- Requirements 2: ROIs (segmented lines of width 1 um) correspondent to each profile have been added to the ROI manager
- Output 1: Red*.txt (x position, average fluorescence intensity in Channel 1 across the ROI width at x position)
- Output 2: Gray*.txt (x position, average fluorescence intensity in Channel 2 across the ROI width at x position)

Script_R3_HistogramsRendering_ProfilesToDemographs:
- Input: Red*.txt (Allows for contemporaray analysis of multiple cells from multiple fields of view; see "file input" section within "Conventional_Like_Analysis_Histograms")
- Output 1: XXX_profiles_ordered.txt (Channel 1 fluorescence profiles ordereed by cell length)
- Output 2: XXX_profiles_ordered_matrix.txt (Channel 1 matrix used to represent the fluorescence profiles as demographs via hist2d() - maxY is defined for each cell)
- Output 3: XXX_demograph.png

Script_R4_Average_Profile:
- Input: XXX_profiles_ordered.txt
- Output: XXX_NormalizedAverageProfile.txt

# Single molecule localization microscopy data analysis

Script_Rv (Can be used to simulate data as well):
- Input 1: AreaListX.RData (from focused cells) | R.Cell*.txt
- Input 2: Channel_#_cells_drifted_filtered.txt
- Output 1: Gest_1.png

Script_R5P1_SMLM_NearestNeighbour:
- Input 1: Channel_#_cells_drifted_filtered.txt (from focused cells)
- Input 2: AreaListX.RData (from focused cells)
- Manual Input required 1: Channel (Red,Green,...)
- Manual Input required 2: Field (1,2,...,n)
- Output: Channel_#_cells_drifted_filtered_NearestNeighbour.txt

Script_R5P2_OPTICS:
- Input: Channel_#_cells_drifted_filtered_NearestNeighbour.txt
- Manual Input required 1: minPts (minimum points necessary to start clustering)
- Manual Input required 2: eps_cl (for the first level of clustering)
- Manual Input required 3: eps_cl (for the second level of clustering)
- Output: Channel_#_cells_drifted_filtered_NearestNeighbour_OPTICS.txt

Script_R5P3_CBC (Only for dual-colour experiments):
- Input 1: Channel_#_cells_drifted_filtered_NearestNeighbour_OPTICS.txt (first channel)
- Input 2: Channel_#_cells_drifted_filtered_NearestNeighbour_OPTICS.txt (second channel)
- Manual input 1: Max search radius (300nm)
- Manual input 2: Search radius interval (10nm) 
- Output 1: ChannelR#_cells_drifted_filtered_NearestNeighbour_OPTICS_CBC.txt
- Output 2: ChannelG#_cells_drifted_filtered_NearestNeighbour_OPTICS_CBC.txt

# References
- M. Ovesný, P. Křížek, J. Borkovec, Z. Švindrych, G. M. Hagen. ThunderSTORM: a comprehensive ImageJ plugin for PALM and STORM data analysis and super-resolution imaging. Bioinformatics 30(16):2389-2390, 2014.
