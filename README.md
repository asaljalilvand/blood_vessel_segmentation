### Blood Vessel Segmentation
Final project for Image Processing course, fall 2016, Shahid Beheshti University.

Simple implementaion of the paper *"Saleh, M. D., Eswaran, C. & Mueen, A. (2011). An Automated Blood Vessel Segmentation Algorithm Using Histogram Equalization and Automatic Threshold Selection.. J. Digital Imaging, 24, 564-572."*

Dataset: [DRIVE: Digital Retinal Images for Vessel Extraction](https://drive.grand-challenge.org/)

Goal: Segmentation of blood vessels in retinal images
Input: RGB image of retina
Output: two bianry images with black background and while vessels (one from the gray-scaled input, one from the green channel of the input)
Steps (the algorithm flow is in VesselSegmentation.m):
1. Grey scaled image generation + green channel extraction
2. Contrast enhancement (flat.m)
3. Background exclusion (bgExclusion.m)
4. Thresholding (otsu.m)
5. Post filteration

in the sample output, you can find result of applying each step of the algorithm on a retina image.

to run the project, use test.m file. The input files should be in a directory called "test". The input files can be acquired from the DRIVE pulic dataset.
