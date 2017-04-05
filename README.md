# MATLAB Port of Fast Optical Flow using Dense Inverse Search (DIS) #

Our code is released only for scientific or personal use.
Please contact us for commercial use.
  
## Compiling ##

The program was only tested under a 64-bit Linux distribution.
SSE instructions from built-in X86 functions for GNU GCC were used.

The following will build four binaries: 
Two for optical flow (`run_OF_*`) and two for depth from stereo (`run_DE_*`).
For each problem, a fast variant operating on intensity images (`run_*_INT`) and 
a slower variant operating on RGB images (`run_*_RGB`) is provided.

```
make all
```

The code depends on Eigen3 OpenCV and MATLAB. However, OpenCV is only used for image loading, 
scaling and gradient computation (`run_dense.cpp`). It can easily be replaced by other libraries.
      
Aditionally P. Dollar's toolbox is required for visualizing the flow. You can get it from [here](https://pdollar.github.io/toolbox/). This is only required for visualizing the flow not for calculating the flow. See `examples/example.m for more information`

      
## Usage ##
The interface for all four mex functions (`run_*_*()`) is the same.

VARIANT 1 (Uses operating point 2 of the paper, automatically selects coarsest scale):

` output = run_*_*(image1, image2 ) `


VARIANT 2 (Manually select operating point X=1-4, automatically selects coarsest scale):

` output = run_*_*(image1, image2, X) `


The optical flow output is a 2-D MATLAB matrix with x and y flows.

The interface for depth from stereo is exactly the same. 
(http://vision.middlebury.edu/stereo/code/)

For more information refer to the ` example_1.m ` file in the examples folder.
## Bugs and extensions ##

If you find bugs, etc., please feel free to contact me at <zsameem@example.com>

Or

http://www.vision.ee.ethz.ch/~kroegert/

## History ##

July 2016 	v1.0.0 - Initial Release
August 2016 	v1.0.1 - Minor Bugfix: Error in L1 and Huber error norm computation.

## CITATION ##

If used this work, please cite:

`@inproceedings{kroegerECCV2016,
   Author    = {Till Kroeger and Radu Timofte and Dengxin Dai and Luc Van Gool},
   Title     = {Fast Optical Flow using Dense Inverse Search},
   Booktitle = {Proceedings of the European Conference on Computer Vision ({ECCV})},
   Year      = {2016}} `

Is you use the variational refinement, please additionally cite:

` @inproceedings{weinzaepfelICCV2013,
    TITLE = {{DeepFlow: Large displacement optical flow with deep matching}},
    AUTHOR = {Weinzaepfel, Philippe and Revaud, J{\'e}r{\^o}me and Harchaoui, Zaid and Schmid, Cordelia},
    BOOKTITLE = {{ICCV 2013 - IEEE International Conference on Computer Vision}},
    YEAR = {2013}} `



## LICENCE CONDITIONS ##

GPLv3: http://gplv3.fsf.org/

All programs in this collection are free software: 
you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
