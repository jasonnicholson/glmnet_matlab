# glmnet_matlab
glmnet_matlab is a Matlab port for the efficient procedures for fitting the entire lasso or elastic-net path for linear regression, logistic and multinomial regression, Poisson regression, and the Cox model. 

More information can be found here:
[https://web.stanford.edu/~hastie/glmnet_matlab/index.html](https://web.stanford.edu/~hastie/glmnet_matlab/index.html)

# Background
[Glmnet in Matlab](https://web.stanford.edu/~hastie/glmnet_matlab/index.html) hasn't been updated since 2015-March-11. The binaries are outdated enough that they don't work on MATLAB for Windows in R2019b and R2020b. On Linux, the Fortran compiler (gfortran) is readily available and free. On Linux, you compile and keep going. On Windows, the Intel Fortran compiler is the only official supported compiler by MathWorks. Once I had glmnet_matlab compiled, I sent the binaries to the Standford people, but they didn't respond. Therefore, here are binaries of Glmnet in MATLAB.

# Releases
Different combinations of MATLAB versions and compiler(s) were used to generate the releases. More compilation information can be found in `R?????_Windows_mex_build.log` file inside the zip file where ????? is the MATLAB version such as 2020b. Also, check the `buildR?????.m` file corresponding to your chosen release; more information is found there.

# Build Information
If you want to build yourself, then you will need an Intel Fortran compiler. Start from the `buildR?????.m` scripts and modify as necessary. ????? stands for the MATLAB version such as 2020b.

If your Intel compiler isn't official supported by MathWorks, you can modify an XML compiler configuration to see if your Intel Fortran compiler will work. There are no guarantees that your Intel Fortran compiler will work, but the configuration can be inferred by inspecting an XML compiler configuration file. Start from what is already in the compiler `compiler_configuration` folder. 

# License
GPL-2

Glmnet in Matlab is GPL-2 so this must be GPL-2. See `LICENSE.txt` for the exact GPL-2 license. The main features of GPL-2 are listed below:
- copy and distribute the program’s unmodified source code (Section 1)
- modify the program’s source code and distribute the modified source (Section 2)
- distribute compiled versions of the program, both modified and unmodified (Section 3) provided that:

- all distributed copies (modified or not) carry a copyright notice and exclusion of warranty (Section 1 and 2)
- all modified copies are distributed under the GPL v2 (Section 2)
- all compiled versions of the program are accompanied by the relevant source code, or a viable offer to make the relevant source code available (Section 3)
