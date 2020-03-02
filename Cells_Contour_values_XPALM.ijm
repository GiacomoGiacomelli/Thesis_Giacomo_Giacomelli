 dir=getDirectory("image");
 n = roiManager("count");
 for (i=0; i<n; i++) {
      roiManager("select", i);
      roiManager("rename", i);
      run("Properties... ", "name=0157-0027 position=none stroke=none width=0 fill=none list");
      wait(25);
	  saveAs("Results", dir+"Cells//" + "Cell" + i + ".txt");
	  if (isOpen("Cell"+i+".txt")) { 
       selectWindow("Cell"+i+".txt"); 
       run("Close"); 
   } 
}



