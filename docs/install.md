---
title: installing
layout: default
navigation_weight: 2
---

Installing R
============

R is a cross-platform statistical computing package that runs in the command line. There are various interfaces that run and display R in a more user-friendly format. These are installed separately from R. One of the most popular and polished interfaces is called R studio, and it also happens to be cross-platform. 

In this workshop, we will be using the latest version of R-project together with the RStudio interface. Feel free to try out different options and use what works best for you. Everything you learn in this workshop will be independent of the user interface you choose. 

Below you can find the installation instructions for:

- [Windows](#Windows)
- [Mac](#Mac)
- [Linux](#Linux)

After you install R and R Studio, you should install the packages we'll be using in the workshop. The packages are platform independent. Don't worry, we'll go over what packages are and how to find them during the workshop.

- [Required packages](#Packages)


<a name="Windows">Windows</a>
-----------------------------

### Installing R for Windows

1. Navigate to [https://cran.r-project.org/](https://cran.r-project.org/).
1. If you are asked to choose a mirror, pick any one close to your location.
1. Click "Download R for Windows".
1. Click "base".
1. Click "Download R [version number] for Windows".
1. Proceed through the installation (choose 64-bit if you have a computer with a 64-bit processor; most newer computers do). 
1. After installation, you will notice that R has appeared in your programs folder. This is a default interface for R in Windows. A better interface is R Studio.

### Installing the RStudio Interface for Windows

1. Navigate to [https://www.rstudio.com/](https://www.rstudio.com/)
1. Click "RStudio" or or navigate to "Products --> RStudio"
1. Click "Desktop" to download the Desktop version. 
1. Choose the Windows Installer (selecting 32-bit/64-bit where appropriate)
1. Proceed through the installation. 
1. RStudio should be able to find your default R installation.



<a name="Mac">Mac</a>
---------------------

### Installing R for Mac

1. Navigate to [https://cran.r-project.org/](https://cran.r-project.org/).
1. If you are asked to choose a mirror, pick any one close to your location.
1. Click "Download R for (Mac) OS X".
1. Choose the appropriate package file for your version of Mac OS X.
1. Proceed through the installation.
1. After installation, you will notice that R has appeared in your programs folder. This is a default interface for R in OS X. A better interface is RStudio.

### Installing the RStudio interface for Mac

1. Navigate to [https://www.rstudio.com/](https://www.rstudio.com/)
1. Click "RStudio" or or navigate to "Products --> RStudio"
1. Click "Desktop" to download the Desktop version. 
1. Choose the Mac OS X Installer, download, and run it
1. Follow the install instructions


<a name="Linux">Linux</a>
-------------------------

### Installing R for Linux

For Debian-based versions of Linux (and perhaps others), R is typically included in your package manager. You should be able to install R with the following command (you probably need root privileges; e.g., `sudo`):

- `apt-get install r-base r-base-dev`

In case R is not included with your distribution, You may navigate to [https://cran.r-project.org/](https://cran.r-project.org/), choose "Download R for Linux", and choose the appropriate Linux distribution.

After R is installed, you can open R by opening a terminal and running `R`. A nice interface to use is RStudio.

### Installing the RStudio interface for Linux

1. Navigate to [https://www.rstudio.com/](https://www.rstudio.com/)
1. Click "RStudio" or or navigate to "Products --> RStudio"
1. Click "Desktop" to download the Desktop version. 
1. Choose the Linux Installer appropriate for your version of Linux
1. Open the program with your package manager, and install


<a name="Packages">Packages</a>
--------------------------------
It would be a good idea to install the following packages before the workshop begins. 

- dplyr
- plyr
- tidyr
- reshape2
- ggplot2
- lattice
- ez
- lme4



Open Rstudio and run the following command.

- `install.packages(c("dplyr","plyr","tidyr","ggplot2","reshape2","lattive","ez","lme4"))`
