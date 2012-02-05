---
layout: post
title: "Creating a web proxy with AWS Free Usage Tier"
date: 2012-01-29 01:19
comments: true
published: false
categories: [Development, AWS]
---
[Amazon Web Services(AWS)](http://aws.amazon.com/) offers a [free usage tier](http://aws.amazon.com/free/) that includes a free Amazon EC2 Micro Instance for a year (among other benefits) to help **new** customers get started with the service.

## Limitations
### Cost
The [EC2 Micro Instance](http://aws.amazon.com/ec2/instance-types/) is available for [750 hours](http://aws.amazon.com/free/) during the year, so you can't leave the instance running continuously. Running the instance continuously for an year would cost approximately $160.20: 365 days * 24 hours - 750 hours = 8010 hours * [$0.02 / hour](http://aws.amazon.com/ec2/#pricing) = $160.20 / year.

### Location
The location of your proxy is limited to the regions available through EC2, which are currently [US East (Northern Virginia), US West (Oregon), US West (Northern California), EU (Ireland), Asia Pacific (Singapore), Asia Pacific (Tokyo), South America (Sao Paulo)](http://aws.amazon.com/ec2/faqs/#Is_Amazon_EC2_running_in_more_than_one_region_When_will_EC2_be_expanding_to_new_regions).

### New to AWS
You must be a new customer of AWS. If you use AWS, you don't get access to the Free Tier.

### Convenience
The method described here should be automated. Setting up the AWS instance is a one time setup cost, but starting and stopping it is not convenient, and may not be possible if AWS is not reachable and you didn't start the instance beforehand.

## Creating an AWS account
This is easy, just go to [http://aws.amazon.com/](http://aws.amazon.com/) and sign up for an AWS account.

## Creating an EC2 Micro Instance
1. Navigate to the [EC2 console](https://console.aws.amazon.com/ec2/).
2. Click on "Launch Instance". {% img /images/aws-proxy/launch-instance.png Lauching an instance %}
3. Select "Quicklaunch". {% img /images/aws-proxy/quicklaunch-aws-instance.png Picking an image more quickly %}
4. Pick a meaningful name for your instance.
5. Name your key pair and download it. You'll need it later to set up key based SSH authentication against the machine. {% img /images/aws-proxy/download-aws-keypair.png Downloading AWS keypair %}
6. Select your launch configuration. e.g. Amazon Linux (64 bit).
7. Click on "Continue".
8. On the next screen, click on "Launch". {% img images/aws-proxy/launch-new-aws-instance.png Launching it for real %}

Once you have your instance up and running, you can create an [encrypted tunnel](http://en.wikipedia.org/wiki/SSH_tunnel#Secure_shell_tunneling) through which you can transfer your browsing traffic to the instance.

## Using your instance as a proxy
To use your instance as a proxy, you'll need to start it, get its public IP address, and establish a SSH connection to it, which we'll use to proxy traffic from your browser, instant messenger client, etc.

### Finding your instance's IP address
Your instance will receive a new public IP every time that it's launched. To get its IP address:

1. Log in to the [EC2 console](https://console.aws.amazon.com/ec2/home) {% img images/aws-proxy/ec2-console.png AWS EC2 console starting screen %}
2. On the left hand navigation menu, pick **Instances**.
3. Select your instance. {% img images/aws-proxy/selected-stopped-instance.png %}
4. Click on "Instance Actions" and then on "Start". {% img images/aws-proxy/starting-an-ec2-instance.png %}
5. Click on "Yes, Start" on the confirmation dialog that opens.
6. Once the instance has started, select it again, and scroll the bottom part of the EC2 console until you see the **Public DNS** entry for your instance. This is the address you'll use to connect to your instance via SSH. {% img images/aws-proxy/ec2-instance-public-dns.png %}

### Configuring a SSH client (Windows - [PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html))
To establish a connection to your instance you'll need a SSH client. For Windows platforms I recommend [PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html). If you're using PuTTY, go ahead and download the installer that is labelled **A Windows installer for everything except PuTTYtel**. You'll need **PuTTYgen** (a SSH keypair generator and converter) and **Pageant** (an SSH authentication agent that holds your private keys in memory so you don't have to type the key password repeatedly) later on.

#### Converting your EC2 key to PuTTY (PPK) format
In order to connect to your EC2 instance with PuTTY, you'll need to convert your EC2 keypair to the PuTTY PPK format.

#### Setting up PuTTY
# Start up PuTTY, place the IP address for your instance in the text input, and set the port number to 22.
# If you want, you can give your session a name in the **Saved Sessions** input box. This will allow you to save the PuTTY configuration (i.e. IP address, port number, SSH tunnel configuration). {% img images/aws-proxy/putty-home-screen.png %}
# In the left hand navigation, expand the **SSH** node and click on **Auth**.
# Click on **Browse** and select your private key file. {% img images/aws-proxy/putty-auth-with-private-key.png %}
# In the left hand navigation, under the **SSH** node, click on **Tunnels**.
# Set **Source port** to **7070**, **Destination** to **localhost**, and pick **Dynamic** and **Auto**. This will set up a [SOCKS proxy](http://en.wikipedia.org/wiki/SOCKS) to which you can connect through port 7070 on your local computer. {% img images/aws-proxy/creating-ssh-tunnel-with-putty.png %}
# 

#### Optional: running PuTTY from a USB pen drive
If you'd like to have access to your instance from any Windows computer, you can download a [portable version of PuTTY](http://portableapps.com/apps/internet/putty_portable) to an USB pen drive and configure PuTTY as earlier in the article.

### Configuring a SSH client (Linux)

### Configuring a web browser (Firefox)

