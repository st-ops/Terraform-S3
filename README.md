==============AWS S3 Bucket Module==============

This repo contains a Terraform/OpenTF module for creating an AWS S3 bucket, with the user being able to choose on versioning, and ACLs. 

BY DEFAULT, Versioning is set to False (that is, Disabled), and ACLs are set to private.

================MODULE PARAMETERS===============

This module has the following parameters:

1) bucket_name : Enter a globally unique name for your bucket. (WARNING: BUCKET CREATION WILL FAIL IF NAME IS NOT GLOBALLY UNIQUE!)

Rules for bucket naming:  https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html


2) versioning : Set to false by default. Enter true , to enable versioning


3) public_acl : Configures Public ACL for the bucket. Set to false (that is, Private ACL) by default, enter true to enable Public ACLs (NOT RECOMMENDED FOR GENERAL USE CASE! ENABLING THIS OPTION EXPOSES YOUR BUCKET TO THE PUBLIC!!)

For more information on ACLs : https://docs.aws.amazon.com/AmazonS3/latest/userguide/acl-overview.html


==================MODULE OUTPUTS================

1) ID of the created bucket
2) The bucket's unique Amazon Resource Name (ARN)
