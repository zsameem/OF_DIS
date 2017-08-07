%% Example script for generating optical flow from video
addpath(genpath('../'));

% Built in video OF traffic
traffic_vid = VideoReader('traffic.mj2');

% Read video statistics
nframes = traffic_vid.NumberOFFrames;
vid_height = traffic_vid.Height;
vid_width = traffic_vid.Width;

% Create a 4d array to store video data
vid_array = zeros(vid_height,vid_width,3,nframes,'uint8');

% Create arrays to store horizontal and vertical optical flow flow data
OF_array_coarse = zeros(vid_height,vid_width,2,nframes-1,'single');
OF_array_fine = zeros(vid_height,vid_width,2,nframes-1,'single');

% Create arrays to store optical flow data in colour
color_OF_array_coarse = zeros(vid_height,vid_width,3,nframes-1,'uint8');
color_OF_array_fine = zeros(vid_height,vid_width,3,nframes-1,'uint8');

% Read the first frame
vid_array(:,:,:,1) = read(traffic_vid,1);

% Read the rest OF the video
for i = 2 : nframes
    vid_array(:,:,:,i) = read(traffic_vid,i);
end

%% Estimate optical flow using coarsest scale and measure computation time
% flowToColor function defined in P. Dollars toolbox. The function
% flowToColor() is defined in it. Make sure you install it before running
% the command below. Otherwise you will get errors.

tic;
for i = 2 : nframes
    previous_frame_greyscale = rgb2gray(vid_array(:,:,:,i-1));
    current_frame_greyscale = rgb2gray(vid_array(:,:,:,i));
    OF_array_coarse(:,:,:,i) = run_OF_INT(previous_frame_greyscale, current_frame_greyscale, 2);
    color_OF_array_coarse(:,:,:,i) = flowToColor(OF_array_coarse(:,:,:,i));
end
toc;
%% Estimate optical flow using finest scale and measure computation time
% flowToColor function defined in P. Dollars toolbox. The function
% flowToColor() is defined in it. Make sure you install it before running
% the command below. Otherwise you will get errors.

tic;
for i = 2 : nframes
    previous_frame_greyscale = rgb2gray(vid_array(:,:,:,i-1));
    current_frame_greyscale = rgb2gray(vid_array(:,:,:,i));
    OF_array_fine(:,:,:,i) = run_OF_INT(previous_frame_greyscale, current_frame_greyscale, 4);
    color_OF_array_fine(:,:,:,i) = flowToColor(OF_array_fine(:,:,:,i));
end
toc;
%% Concatenate coarse and fine optical flow results with original and play video
OF_comparison_array = horzcat(color_OF_array_coarse,color_OF_array_fine,vid_array);
implay(OF_comparison_array)
