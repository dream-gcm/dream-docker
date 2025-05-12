Stephanie Leroux

(lastest update 2025-05-12)

**Purpose:** 
* This is a tutorial with instructions to download the Docker Desktop app, install it, and get the available Docker image that  provides an environment that is ready for the DREAM model to work. 
* Note that this Docker image is in open acces but  does not contain the model code itself, that should be downloaded through git (see the instructions below) if you are an authorized member of the group (otherwise please contact us). 

_Prerequisites_: 
* you'll need to know your github identifiers
* you'll need  to a member of the dream-gcm github organization (send us your github login so that you can be added as a member)
* Either you already have Docker and git installed on your computer, or you need to be ROOT to install them following the instructions below. If you're not ROOT and don't have Docker and git installed, please contact your IT administrator before the workshop to have them installed for you.
* MAC users: not absolutely necessary but highly recommanded : should have the Command Line Tools installed (if not yet installed,   `xcode-select --install` then `sudo xcodebuild -license accept` in a terminal should do it. More info on https://mac.install.guide/commandlinetools/4  if needed).

# 1 Install the Docker Desktop app 
_[These steps have to be done once for all.]_
* https://www.docker.com/products/docker-desktop/
* There is a version for Mac OS, Linux and Windows plateform

# 2 Load the DREAM Docker image 
_[These steps have to be done once for all.]_
* Launch the Docker Desktop app. It opens a window that you can then close. Docker will now run in the background and the Docker commands are now available in your terminal.
* In a terminal, run the docker command below to download the DREAM Docker image on your local machine. It might take a while to download depending on your internet connexion.
```
docker pull  ghcr.io/dream-gcm/dreamgcm-env:latest
```
The long downloading  has to be done only once for all. Then it  will be kept  on your local machine and you can re-activate it anytime by running the Docker app and the Docker command in the terminal as explained below.

# 3. Download the DREAM model code an tools
_[These steps have to be done once for all.]_

To avoid messing up with your local install of DREAM (if you already have one) i suggest that you create a new directory `DREAM-latest-Docker` where you will download the model code from scratch as if you were a workshop attendant. Because the DREAM code repository is private you will need to enter your github id and password when cloning.
```
# create directory
mkdir DREAM-latest-Docker

# download the model code and plot tools in this new directory with git
cd DREAM-latest-Docker
git clone https://github.com/dream-gcm/DREAM.git
git clone https://github.com/dream-gcm/dream-tools.git

# In the code directory, switch to my dev branch where the scripts have been prepared to work easily within the DOcker
cd DREAM
git checkout dev-in-Docker
```

# 4. Run Docker
_[These steps have to be done each time you want to use the DREAM model.]_

* On your local machine, open the Docker Desktop app if not already open.
*  Then in a terminal, run the docker command below, after editing  the path `your-local-path-to-DREAM-latest-Docker/` where you have just download the codes) .
```
docker run -it --rm -p 8888:8888 -v your-local-path-to-DREAM-latest-Docker/:/home/jovyan/work ghcr.io/dream-gcm/dreamgcm-env:latest jupyter lab --ip=0.0.0.0 --no-browser --allow-root
```
You should now have some text printed in the terminal saying that a server is running.

* But first, some explanation of what this command does:
  * In this command, we tell Docker to run the Docker image “dreamgcm-env” from the GitHub website `ghcr.io/dream-gcm/dreamgcm-env` and inside the Docker,  run the JupyterLab  and   link port 8888 to the port inside the image to display the Jupyterlab.
  * **Importantly** we also link  the local directory on your machine where the DREAM code is (`your-local-path-to-DREAM-latest-Docker/`) to the virtual directory `/home/jovyan/work/` in the Docker image. Once in the Docker, you will work in `/home/jovyan/work/` but your actions will happen in `your-local-path-to-DREAM-latest-Docker/`.
  *  Copy the link that printed in the terminal that looks like  http://127.0.0.1:8888/lab?token=…….  (But copy the entire link with the token with numbers)
  *  Paste this link in your favourite browser. It should open a JupyterLab window like this:
_TODO: Insert screenshot_ ![](Screenshot%202025-01-30%20at%2016.35.04.png)
  *  Click on the “Terminal” icon to open a terminal (this terminal runs in the Docker, with its associated environment). There you can start working in the model as usual, and your environnement is already ready to work with Fortran, netcdf, and all that.
  *  On the left, click on the “work” directory, then in DREAM directory, and you can see the files and subdirectories from the DREAM model code. You can open and edit those file within the JupyterLab too by clicking on them.


# 8 Close Docker 
* when you are done with your model session, you can close the Docker app and the terminal from which you had run the Docker command.
* next time you want to use the model, start the instructions at section 4 above.
