# Terraform

<p>This terraform resource fulfills the same task in 2 different ways.<br />
  The first way used is the resources under vpc,<br /> 
which are relatively longer and where separate aws resources 
are called for each task.<br />
You can access this resource from the <a href="https://github.com/MustafaKemalAtaturk/Terraform/tree/main/vpc">Terraform/vpc</a> directory.<br />
  <em>This resource runs that command</em>
  <code>terraform apply -var-file=variable.tfvars</code> </p>
<p>Module structure was used for the relatively shorter way and the desired configuration<br /> 
  was realized with the source "terraform-aws-modules/vpc/aws".<br />
  You can access this resource from the <a href="https://github.com/MustafaKemalAtaturk/Terraform/tree/main/vpc/modul">Terraform/vpc/modul</a>
"terraform-aws-modules/vpc/aws"
  <em>This resource runs that command</em>
  <code>terraform apply</code> </p>
  

<strong>What does this TERRAFORM resource do?</strong> 

<ul>
<li>This terraform resorce creates private and public vpc on aws
<li>Adds Internet Gateway</li>
<li>Creates and attaches a NAT GW to the private subnet</li>
<li>Creates and configures the route tables.</li>
<li>Creates an S3 bucket called devops which includes a directory called homeworks and</li>
<li>Creates an encrypted object in that directory called test_object.txt</li>
</ul>
