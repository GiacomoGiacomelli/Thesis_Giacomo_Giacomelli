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
- Output: Cell*.txt (Requires the existence of a folder named "Cells" within the working directory, it outputs a single file for each ROI listed within the ROI manager)

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
- Generally, SMLM data tables can be imported in the Fiji plugin ThunderSTORM (M. Ovesný et al. 2014) and rendered as Normalized Gaussian, Histograms and other rendering variants. The resulting rendering can be used for conventional-like analysis. 
- ThunderSTORM Import Header: id, frame,	x [nm],	y [nm],	sigma [nm],	intensity [photon],	offset [photon],	bkgstd [photon],	chi2,	uncertainty_xy [nm]


Conventional_Like_Analysis_Histograms:
- Input 1:
write.table(REDTOT1, file="../XXX_profiles_ordered.txt",sep=",",row.names = FALSE, quote=FALSE)   ###save file containing the fluorescence profiles ordereed by cell length
write.table(df2, file="../XXX_profiles_ordered_matrix.txt",sep=",",row.names = FALSE, quote=FALSE)  ###save matrix used to represent the fluorescence profiles as demographs via hist2d()

a<-seq(0,max(df2[1]), by=0.02)

rf1<-colorRampPalette(c("black","blue","red","red","red")) ####Define color scale
r <- rf1(256)

png(file="../XXX_demograph.png",height=3000,width=2500,res=600)   ####Demograph
h2<-hist2d(df2, nbins=c(length(a)-1,length(unique(REDTOT1$V3))), col=r)
dev.off()

# Single molecule localization microscopy data analysis

# References
- M. Ovesný, P. Křížek, J. Borkovec, Z. Švindrych, G. M. Hagen. ThunderSTORM: a comprehensive ImageJ plugin for PALM and STORM data analysis and super-resolution imaging. Bioinformatics 30(16):2389-2390, 2014.
