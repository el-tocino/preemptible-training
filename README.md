## starting an ongoing training instance in gcp.

#### Create a sample VM

I used: n1, 8 cpu/30gb ram, add a GPU (t4) and set the other options you like.  
Under Cloud API access, make sure you allow all.  
Expand management options and turn preemptible On. 
Start it up and get the software you want installed and running.  
I used the google image for machine learning as a base, put TTS and some other things I used on it.  

#### Add tools and restart scripts.

Add the auto-start training service file, and the tensorboard service file to /etc/systemd/system.  Edit them to add your relevant user and path arguments!  Add the train.sh and tboard.sh to your home directory.  Be sure to mark them executable.  Make a "logs" directory in your home dir.  

Add a cron entry for the halting script. 
```*/5 * * * * /home/$yourusernamehere/halter.sh```
This is a kludge, but one that works for me, since training randomly stopped training but kept running a couple of times.  Had to reboot to get it to do anything.  
Reboot to test everything works as expected.  

#### Create snapshot

Once the vm is working how you like, stop it.  Go to snapshots, create a snapshot from the stopped VM.  
Next go to Images, create an image from the snapshot.  

#### Make an instance group. 

Go to instance groups, create a new instance group.  Turn off autoscaling.  Set the maximum number of instances to 1.  Select instance template, then create a new instance template.  Choose the same vm parameters for this instance template as you used for your VM (GPU, cpu, mem, pre-emptible turned on), and make very sure the boot disk is SSD persistent storage! This will make training awful otherwise!  SSD only. Select the custom image you previously created.  

#### Watch it run away with your data

Once you save the instance group it will become active.  A new VM instance will start up.  Log into it, and verify that your scripts started everything up as planed.  


