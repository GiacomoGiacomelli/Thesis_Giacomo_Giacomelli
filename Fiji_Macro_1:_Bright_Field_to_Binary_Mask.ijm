name = getTitle(); 
dir=getDirectory("image");
run("Scale...", "x=10 y=10 width=5120 height=5120 interpolation=Bicubic average create title=Results");
setAutoThreshold("Default");
run("Convert to Mask");
run("Convert to Mask");
run("Fill Holes");
run("Dilate");
run("Dilate");
run("Dilate");
run("Dilate");
run("Dilate");
run("Dilate");
run("Dilate");
run("Dilate");
run("Dilate");
run("Dilate");
run("Dilate");

saveAs("Text Image", dir + substring(name,0,4) + "polyMask" + ".txt");
saveAs("Tiff", dir + substring(name,0,4) + "polyMask" + ".tif");
