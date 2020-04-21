# Thesis_Giacomo_Giacomelli

This repository contains the following items:

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
- Output: ROIs ready to be used for "Script_R2_PALM filtering" script -> R.Cell*.txt
