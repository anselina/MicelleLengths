Introduction
----------------
Given a folder of images of micelles taken using a Transmission Electron Microscope (TEM), this program creates binary copies of each image (after removing unwanted segments) to then measure the lengths of the remaining micelles. 


Details
------------

####Image Processing####
1. Unwanted segments are removed automatically, according to parameters in `test.m`.
    - Automated removal of: background noise, bottom TEM labels, small speckles, thick fibers
    - Adjust these parameters in `test.m` (e.g., size of speckles, thickness of fibers that are automatically removed)
2. Segments can also be selected manually for removal.
         
####Input/Output####
- TIFF images are used as input.
- Lengths are written to a plain text file.


Examples
--------------
See `sample` for some sample TEM images that can be used with this program.