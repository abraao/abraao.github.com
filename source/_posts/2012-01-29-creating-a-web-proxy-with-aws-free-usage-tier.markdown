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
The [EC2 Micro Instance](http://aws.amazon.com/ec2/instance-types/) is available for [750 hours](http://aws.amazon.com/free/) during the year, so you can't leave the instance running continuously. Running the instance continuously for an year would cost approximately $160.20: 365 days * 24 hours - 750 hours = 8010 hours * [$0.02 / hour](http://aws.amazon.com/ec2/#pricing) = $160.20 / year.

The location of your proxy is limited to the regions available through EC2, which are currently [US East (Northern Virginia), US West (Oregon), US West (Northern California), EU (Ireland), Asia Pacific (Singapore), Asia Pacific (Tokyo), South America (Sao Paulo)](http://aws.amazon.com/ec2/faqs/#Is_Amazon_EC2_running_in_more_than_one_region_When_will_EC2_be_expanding_to_new_regions).

You must be a new customer of AWS. If you use AWS, you don't get access to the Free Tier.

## Creating an AWS account


## Creating an EC2 Micro Instance


## Configuring PuTTy and your browser

