# tf-kitchen-terraform

This example demonstrates how to test a Terraform module. It uses InSpec as test  framework.

Find more details here: https://newcontext-oss.github.io/kitchen-terraform/getting_started.html

Here is a test run:

´´´
mkaesz@arch ~/w/tf-testing (master)> bundle exec kitchen converge
-----> Starting Test Kitchen (v2.5.3)
-----> Creating <kt-suite-terraform>...
$$$$$$ Verifying the Terraform client version is in the supported interval of >= 0.11.4, < 0.13.0...
$$$$$$ Reading the Terraform client version...
       Terraform v0.12.29
       + provider.null v2.1.2
$$$$$$ Finished reading the Terraform client version.
$$$$$$ Finished verifying the Terraform client version.
$$$$$$ Initializing the Terraform working directory...
       Upgrading modules...
       - kt_test in ../../..

       Initializing the backend...

       Initializing provider plugins...
       - Checking for available provider plugins...
       - Downloading plugin for provider "null" (hashicorp/null) 2.1.2...

       The following providers do not have any version constraints in configuration,
       so the latest version was installed.

       To prevent automatic upgrades to new major versions that may contain breaking
       changes, it is recommended to add version = "..." constraints to the
       corresponding provider blocks in configuration, with the constraint strings
       suggested below.

       * provider.null: version = "~> 2.1"

       Terraform has been successfully initialized!
$$$$$$ Finished initializing the Terraform working directory.
$$$$$$ Creating the kitchen-terraform-kt-suite-terraform Terraform workspace...
       Created and switched to workspace "kitchen-terraform-kt-suite-terraform"!

       You're now on a new, empty workspace. Workspaces isolate their state,
       so if you run "terraform plan" Terraform will not see any existing state
       for this configuration.
$$$$$$ Finished creating the kitchen-terraform-kt-suite-terraform Terraform workspace.
       Finished creating <kt-suite-terraform> (0m0.89s).
-----> Converging <kt-suite-terraform>...
$$$$$$ Verifying the Terraform client version is in the supported interval of >= 0.11.4, < 0.13.0...
$$$$$$ Reading the Terraform client version...
       Terraform v0.12.29
       + provider.null v2.1.2
$$$$$$ Finished reading the Terraform client version.
$$$$$$ Finished verifying the Terraform client version.
$$$$$$ Selecting the kitchen-terraform-kt-suite-terraform Terraform workspace...
$$$$$$ Finished selecting the kitchen-terraform-kt-suite-terraform Terraform workspace.
$$$$$$ Downloading the modules needed for the Terraform configuration...
       - kt_test in ../../..
$$$$$$ Finished downloading the modules needed for the Terraform configuration.
$$$$$$ Validating the Terraform configuration files...
       Success! The configuration is valid.

$$$$$$ Finished validating the Terraform configuration files.
$$$$$$ Building the infrastructure based on the Terraform configuration...
       module.kt_test.null_resource.create_file: Creating...
       module.kt_test.null_resource.create_file: Provisioning with 'local-exec'...
       module.kt_test.null_resource.create_file (local-exec): Executing: ["/bin/sh" "-c" "echo 'this is my first test' > foobar"]
       module.kt_test.null_resource.create_file: Creation complete after 0s [id=3491937522851164236]

       Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
$$$$$$ Finished building the infrastructure based on the Terraform configuration.
$$$$$$ Reading the output variables from the Terraform state...
$$$$$$ Finished reading the output variables from the Terraform state.
$$$$$$ Parsing the Terraform output variables as JSON...
$$$$$$ Finished parsing the Terraform output variables as JSON.
$$$$$$ Writing the output variables to the Kitchen instance state...
$$$$$$ Finished writing the output varibales to the Kitchen instance state.
$$$$$$ Writing the input variables to the Kitchen instance state...
$$$$$$ Finished writing the input variables to the Kitchen instance state.
       Finished converging <kt-suite-terraform> (0m1.25s).
-----> Test Kitchen is finished. (0m2.54s)
´´´

´´´
mkaesz@arch ~/w/tf-testing (master)> bundle exec kitchen verify
-----> Starting Test Kitchen (v2.5.3)
-----> Setting up <kt-suite-terraform>...
       Finished setting up <kt-suite-terraform> (0m0.00s).
-----> Verifying <kt-suite-terraform>...
$$$$$$ Reading the Terraform input variables from the Kitchen instance state...
$$$$$$ Finished reading the Terraform input variables from the Kitchen instance state.
$$$$$$ Reading the Terraform output variables from the Kitchen instance state...
$$$$$$ Finished reading the Terraform output varibales from the Kitchen instance state.
$$$$$$ Verifying the systems...
$$$$$$ Verifying the 'basic' system...

Profile: default
Version: (not specified)
Target:  local://

  ✔  file_check: File ./test/fixtures/tf_module/foobar
     ✔  File ./test/fixtures/tf_module/foobar is expected to exist


Profile Summary: 1 successful control, 0 control failures, 0 controls skipped
Test Summary: 1 successful, 0 failures, 0 skipped
$$$$$$ Finished verifying the 'basic' system.
$$$$$$ Finished verifying the systems.
       Finished verifying <kt-suite-terraform> (0m0.30s).
-----> Test Kitchen is finished. (0m0.70s)
´´´
