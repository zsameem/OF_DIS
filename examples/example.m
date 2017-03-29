%% Example script for generating the optical flow
addpath(genpath('../'));

img1 = imread('frame_0045.png');
img2 = imread('frame_0046.png');

% Make sure you have mex compiled the project and generated mex binaries 
% before running this script

% For running the integer variant convert the input images from RGB to 
% grayscale
img1 = rgb2gray(img1);
img2 = rgb2gray(img2);

flow = run_OF_INT(img1, img2, 2);

% flowToColor function defined in P. Dollars toolbox. The function
% flowToColor() is defined in it. Make sure you install it before running
% the command below. Otherwise you will get errors.

imshow(flowToColor(flow));