#9. Graphics Devices
- Where The plot Appear :
  - Screen Device
  - PDF
  - PNG/JPEG
  - Scalable vector Graphics
- graphics devices is implemented in the **grDevices** package, which comes with a standard R installation and is typically loaded by default.

##9.1 The Process of Making A plot

Where will the plot be made? On the screen? In a file?
• How will the plot be used?
  - Is the plot for viewing temporarily on the screen?
  - Will it be presented in a web browser?
  - Will it eventually end up in a paper that might be printed?
  - Are you using it in a presentation?
• Is there a large amount of data going into the plot? Or is it just a few points?
• Do you need to be able to dynamically resize the graphic?
• What graphics system will you use: base, lattice, or ggplot2? These generally cannot
be mixed.

## 9.2 How Does a plot get created
1. Call a plotting function like plot, xyplot, or qplot
2. The plot appears on the screen device
3. Annotate the plot if necessary
4. Enjoy
## Saving Plot,how it goes?

1. Explicitly launch a graphics device
2. Call a plotting function to make a plot (Note: if you are using a file device, no plot will appear on the screen)
3. Annotate the plot if necessary
4. Explicitly close graphics device with dev.off() (this is very important!)

Example ? [Here]()

## 9.3 Graphics File Devices
There are two basic types of file devices to consider: vector and bitmap devices.
- Some of the key vector formats are :
  - pdf: useful for line-type graphics, resizes well, usually portable, not efficient if a plot has many objects/points

  - svg: XML-based scalable vector graphics; supports animation and interactivity,potentially useful for web-based plots

  - win.metafile: Windows metafile format (only on Windows)

  - postscript: older format, also resizes well, usually portable, can be used to create encapsulated postscript files; Windows systems often don't have a postscript viewer

- Some examples of bitmap formats are
  - png: bitmapped format, good for line drawings or images with solid colors, uses lossless compression (like the old GIF format), most web browsers can read this format natively, good for plotting many many many points, does not resize well

  - jpeg: good for photographs or natural scenes, uses lossy compression, good for plotting many many many points, does not resize well, can be read by almost any computer and any web browser, not great for line drawings

  - tiff: Creates bitmap files in the TIFF format; supports lossless compression

  - bmp: a native Windows bitmapped format
## 9.4 Multiple Open Graphics Devices
  - You can do it :D , change the *dev.set(<integer>)* TO how many graphicsdevices you want .
  Example again ? [Here]()

## 9.5 Copying plots
  - you can do it .*dev.copy()* <- Copy from one device to another
  - *dev.copy2pdf()* <- copy current plot within screen to pdf
  - NOTE :
  result may not be identical to the original. In particular, when copying from the screen device to a file, depending on the size of the file device, many annotations such as axis labels may not look right.
  Example ? [Here]()

#9.6 Summary
- Plots must be created on a graphics device. The default graphics device is almost always the screen device, which is most  useful for exploratory analysis.
- File devices are useful for creating plots that can be included in other documents or sent to other people

For file devices, there are vector and bitmap formats
  - Vector formats are good for line drawings and plots with solid colors using a modest number of points
  -  Bitmap formats are good for plots with a large number of points, natural scenes or web-based plot
