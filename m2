AWSTemplateFormatVersion: 2021-09-09

Parameters:
  MyKeyName:
    Type: AWS::EC2::KeyPair::KeyName
    Description: Select the keypair

Mappings:
  MyRegionMap:
    us-east-2:
      HVM64: ami-0cd3dfa4e37921605
    us-west-1:
      HVM64: ami-0ec6517f6edbf8044     

Resources:
  MyVMInstance:
    Type: AWS::EC2::Instance
    Properties:
      ImageId: !FindInMap
        - MyRegionMap
        - !Ref 'AWS::Region'
        - HVM64
      InstanceType: t2.micro
      KeyName: !Ref MyKeyName
