### 1st-form "All-In-One - terraform"

#### get code

`git clone https://github.com/shelleg/terraform-101.git`

#### terraform init

`cd terraform-101/labs/1st-form && terraform init`

Which should yield:

```yaml
Initializing provider plugins...
- Checking for available provider plugins on https://releases.hashicorp.com...
- Downloading plugin for provider "aws" (1.21.0)...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.aws: version = "~> 1.21"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

#### terraform plan
Which should yield:

```yaml
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  + aws_instance.example
      id:                           <computed>
      ami:                          "ami-58d7e821"
      associate_public_ip_address:  <computed>
      availability_zone:            <computed>
      ebs_block_device.#:           <computed>
      ephemeral_block_device.#:     <computed>
      get_password_data:            "false"
      instance_state:               <computed>
      instance_type:                "t2.micro"
      ipv6_address_count:           <computed>
      ipv6_addresses.#:             <computed>
      key_name:                     <computed>
      network_interface.#:          <computed>
      network_interface_id:         <computed>
      password_data:                <computed>
      placement_group:              <computed>
      primary_network_interface_id: <computed>
      private_dns:                  <computed>
      private_ip:                   <computed>
      public_dns:                   <computed>
      public_ip:                    <computed>
      root_block_device.#:          <computed>
      security_groups.#:            <computed>
      source_dest_check:            "true"
      subnet_id:                    <computed>
      tags.%:                       "1"
      tags.Name:                    "xenail01"
      tenancy:                      <computed>
      volume_tags.%:                <computed>
      vpc_security_group_ids.#:     <computed>


Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

#### terraform apply
in my case the instance was already available hence the output was something like the following:

```yaml
terraform apply -auto-approve
aws_instance.example: Refreshing state... (ID: i-0de61ab898cc465b7)


Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
```

#### check result:
Check we have an instance
* in the `eu-west-1` region
* size `t2.micro`
* `ami-58d7e821` ami.
* tag name: `xenial01`

Execute: `aws ec2 describe-instances --filters "Name=tag:Name,Values=xenail01" --region eu-west-1`

Which would yield:
```json
{
    "Reservations": [
        {
            "Groups": [],
            "Instances": [
                {
                    "AmiLaunchIndex": 0,
                    "ImageId": "ami-58d7e821",
                    "InstanceId": "i-0de61ab898cc465b7",
                    "InstanceType": "t2.micro",
                    "LaunchTime": "2018-06-02T17:34:44.000Z",
                    "Monitoring": {
                        "State": "disabled"
                    },
                    "Placement": {
                        "AvailabilityZone": "eu-west-1b",
                        "GroupName": "",
                        "Tenancy": "default"
                    },
                    "PrivateDnsName": "ip-172-31-22-40.eu-west-1.compute.internal",
                    "PrivateIpAddress": "172.31.22.40",
                    "ProductCodes": [],
                    "PublicDnsName": "ec2-34-247-38-231.eu-west-1.compute.amazonaws.com",
                    "PublicIpAddress": "34.247.38.231",
                    "State": {
                        "Code": 16,
                        "Name": "running"
                    },
                    "StateTransitionReason": "",
                    "SubnetId": "subnet-253eac4e",
                    "VpcId": "vpc-203eac4b",
                    "Architecture": "x86_64",
                    "BlockDeviceMappings": [
                        {
                            "DeviceName": "/dev/sda1",
                            "Ebs": {
                                "AttachTime": "2018-06-02T17:34:45.000Z",
                                "DeleteOnTermination": true,
                                "Status": "attached",
                                "VolumeId": "vol-0388f42778613f7d7"
                            }
                        }
                    ],
                    "ClientToken": "",
                    "EbsOptimized": false,
                    "EnaSupport": true,
                    "Hypervisor": "xen",
                    "NetworkInterfaces": [
                        {
                            "Association": {
                                "IpOwnerId": "amazon",
                                "PublicDnsName": "ec2-34-247-38-231.eu-west-1.compute.amazonaws.com",
                                "PublicIp": "34.247.38.231"
                            },
                            "Attachment": {
                                "AttachTime": "2018-06-02T17:34:44.000Z",
                                "AttachmentId": "eni-attach-d09afca3",
                                "DeleteOnTermination": true,
                                "DeviceIndex": 0,
                                "Status": "attached"
                            },
                            "Description": "",
                            "Groups": [
                                {
                                    "GroupName": "default",
                                    "GroupId": "sg-4538d72a"
                                }
                            ],
                            "Ipv6Addresses": [],
                            "MacAddress": "02:da:6d:2e:dd:b4",
                            "NetworkInterfaceId": "eni-1c503a3f",
                            "OwnerId": "329054710135",
                            "PrivateDnsName": "ip-172-31-22-40.eu-west-1.compute.internal",
                            "PrivateIpAddress": "172.31.22.40",
                            "PrivateIpAddresses": [
                                {
                                    "Association": {
                                        "IpOwnerId": "amazon",
                                        "PublicDnsName": "ec2-34-247-38-231.eu-west-1.compute.amazonaws.com",
                                        "PublicIp": "34.247.38.231"
                                    },
                                    "Primary": true,
                                    "PrivateDnsName": "ip-172-31-22-40.eu-west-1.compute.internal",
                                    "PrivateIpAddress": "172.31.22.40"
                                }
                            ],
                            "SourceDestCheck": true,
                            "Status": "in-use",
                            "SubnetId": "subnet-253eac4e",
                            "VpcId": "vpc-203eac4b"
                        }
                    ],
                    "RootDeviceName": "/dev/sda1",
                    "RootDeviceType": "ebs",
                    "SecurityGroups": [
                        {
                            "GroupName": "default",
                            "GroupId": "sg-4538d72a"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Tags": [
                        {
                            "Key": "Name",
                            "Value": "xenail01"
                        }
                    ],
                    "VirtualizationType": "hvm"
                }
            ],
            "OwnerId": "329054710135",
            "ReservationId": "r-026862404171597a5"
        }
    ]
}
```

#### terraform destroy - clean up lab1
```yaml
terraform destroy
aws_instance.example: Refreshing state... (ID: i-0de61ab898cc465b7)

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  - aws_instance.example


Plan: 0 to add, 0 to change, 1 to destroy.

Do you really want to destroy?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_instance.example: Destroying... (ID: i-0de61ab898cc465b7)
aws_instance.example: Still destroying... (ID: i-0de61ab898cc465b7, 10s elapsed)
aws_instance.example: Still destroying... (ID: i-0de61ab898cc465b7, 20s elapsed)
aws_instance.example: Still destroying... (ID: i-0de61ab898cc465b7, 30s elapsed)
aws_instance.example: Still destroying... (ID: i-0de61ab898cc465b7, 40s elapsed)
aws_instance.example: Still destroying... (ID: i-0de61ab898cc465b7, 50s elapsed)
aws_instance.example: Still destroying... (ID: i-0de61ab898cc465b7, 1m0s elapsed)
aws_instance.example: Destruction complete after 1m5s

Destroy complete! Resources: 1 destroyed.
```

#### shell recording
