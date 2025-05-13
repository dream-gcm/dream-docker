# Tutorial  to install a ready-to-use environment to run the DREAM model


**Purpose:** 
* __This tutorial provides  instructions to install a ready-to-use environment to run the DREAM model__.
* This environment (including fortran compiler, netcdf libraries, python  and all what you need) is provided throught a Docker container that you will run on your own machine. Note that the Docker image is in open acces but  does not contain the model code itself, that we will  download from the DREAM github (_authorized members only_ - if you're not yet part of the group, please contact us). 

- This tutorial takes you step-by-step to:

     1. Download the DREAM model code and tools needed for this workshop
     2. Download the Docker Desktop app and install it
     3. Get the Docker image that provides a ready-to-use environment for the DREAM model
     4. Run your Docker container and find the model code in there  


 
**Prerequisites:** 
* You'll need to know your github identifiers
* You'll need  to be a member of the dream-gcm github organization (if not a member aleady, send us your github login so that we can  add you in the group)
* You'll need to be ROOT on your computer to be able to install the Docker Desktop app (instructions below), or else you'll need to already have Docker and git commands installed on your machine before coming to the workshop.
* MAC users: not absolutely necessary but highly recommanded : should have the Command Line Tools installed (if not yet installed,   `xcode-select --install` then `sudo xcodebuild -license accept` in a terminal should do it. More info on https://mac.install.guide/commandlinetools/4  if needed).

# 1. Download the DREAM model code an tools
_[These steps have to be done once for all.]_

* 1.1 Create a directory where you will work during the workshop: `mkdir MY-DREAM-WORKSHOP`


* 1.2 Download the model code from GitHub (follow instructions in option 1 OR option 2):

  <details>
  <summary>Option 1: CLICK HERE to download from the terminal with `git clone`</summary>

  Because the DREAM code repository is private you will need to enter your GitHub ID and password when cloning.

    ```
    # Download the model code and plot tools in the workshop directory with git
    cd MY-DREAM-WORKSHOP
    git clone https://github.com/dream-gcm/DREAM.git
    git clone https://github.com/dream-gcm/dream-tools.git
    
    # In the code directory, switch to the branch `dev-in-Docker` developped specifically for the workshop.
    cd DREAM
    git checkout dev-in-Docker
    ```

  </details>

  <details>
  <summary>Option 2: CLICK HERE to download by clicking on the GitHub webpage</summary>
      
    * Because the DREAM code repository is private you will need to be logged in to [https://github.com/](https://github.com/) before going to the page below and clicking download.
    * Once logged in, go to [https://github.com/dream-gcm/DREAM/tree/dev-in-Docker](https://github.com/dream-gcm/DREAM/tree/dev-in-Docker)
    * Click on the green CODE button and then 'Download zip' in the menu. 
    * Save this zip file in your workshop directory and unzip it.
    
  </details>



# 2 Install the Docker Desktop app 
_[These steps have to be done once for all.]_

* Go to the website: [https://www.docker.com/products/docker-desktop/](https://www.docker.com/products/docker-desktop) and click on the blue button `DOWNLOAD the DOCKER APP`.
* There is a version for Mac OS, Linux and Windows plateforms (however we won't be able to provide full support for Windows users - you'll be on your own). 


# 3 Load the DREAM Docker image 
_[These steps have to be done once for all.]_

* Launch the Docker Desktop app (double-click on the icon). It opens a window that you can then close. Docker will now run in the background and the Docker commands are now available in your terminal.
* In a terminal, run the docker command below to download the DREAM Docker image on your local machine. It might take a while to download depending on your internet connexion.
```
docker pull  ghcr.io/dream-gcm/dreamgcm-env:latest
```
The long downloading  has to be done only once for all. Then it  will be kept  on your local machine and you can re-activate it anytime by running the Docker app and the Docker command in the terminal as explained below.



# 4. Run the DREAM Docker container
_[These steps have to be done each time you want to use the DREAM model.]_

* On your local machine, open the Docker Desktop app if not already open.
*  Then in a terminal, run the docker command below, after editing  the path `your-local-path-to-MY-DREAM-WORKSHOP/` where you have just download the codes) .
```
docker run -it --rm -p 8888:8888 -v your-local-path-to-MY-DREAM-WORKSHOP/:/home/jovyan/work ghcr.io/dream-gcm/dreamgcm-env:latest jupyter lab --ip=0.0.0.0 --no-browser --allow-root
```
You should now have some text printed in the terminal saying that a server is running.

But first, some explanation of what this command does:
  * In this command, we tell Docker to run the Docker image “dreamgcm-env” from the GitHub website `ghcr.io/dream-gcm/dreamgcm-env` and inside the Docker,  run the JupyterLab  and   link port 8888 to the port inside the image to display the Jupyterlab.
  * **Importantly** we also link  the local directory on your machine where the DREAM code is (`your-local-path-to-MY-DREAM-WORKSHOP/`) to the virtual directory `/home/jovyan/work/` in the Docker image. Once in the Docker, you will work in `/home/jovyan/work/` but your actions will happen in `your-local-path-to-MY-DREAM-WORKSHOP/`.

*  Copy the link that printed in the terminal that looks like  http://127.0.0.1:8888/lab?token=…….  (But copy the entire link with the token with numbers)
*  Paste this link in your favourite browser. It should open a JupyterLab window like this:
![screenshot1](./FIGS/Screenshot1.png)

*  Click on the “Terminal” icon to open a terminal (this terminal runs in the Docker, with its associated environment). There you can start working on the model as usual, and your environnement is already ready to work with Fortran, netcdf, and all that.
*  On the left, click on the “work” directory, then in DREAM directory, and you can see the files and subdirectories from the DREAM model code. You can open and edit those file within the JupyterLab too by clicking on them.

# 5. Congratulations! You're now ready to play with the DREAM model. 
Let's move to the [next tutorial]() for a basic usage of DREAM.

# 6 Close Docker 
* When you are done with your DREAM model session, you can close the Docker app and the terminal from which you had run the Docker command.
* Next time you want to use the model, start the instructions at section 4 above.
