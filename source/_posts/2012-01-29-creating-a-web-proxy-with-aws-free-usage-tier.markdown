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

## Configuring PuTTy and your browser

