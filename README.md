# GameStore Project

## About project
This project is an exempe of creating environment for deploying of GameStore web application. 
GameStore is an ASP.NET Web Forms application for accessing a game catalog. The functionality of the GameStore is restricted by following operations: browse the catalog, create, edit and delete entries in the catalog placed in the MS SQL DB.

## Goals 
Automate the process of creating deploymen environment (as idempotent operation) with following tools: Windows 2016 server, SQL EXPRESS server, IIS server.
This infrastructure should provide verification of the functionality and build process of the web application (Store).

## Tools
* Vagrant ver 2.2.3
* VirtualBox ver 6.0.4

## Repository Structure  
* StoreProject - sources code of web-application and its build.
* Vagrant - scripts for creation environment using Vagrant + VirtualBox and deployment on the virtual machine (VM).

## Runbook
1. Download and unzip project's code and scripts from [GitHub repo](https://github.com/shamalets/SSDevOps-Demo1-StoreProject)
2. Install [Vagrant](https://www.vagrantup.com/downloads.html)
3. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
4. Run Powershell (PS) and go to the directory Vagrant from our project (with Vagratfile) using cd command
5. Start the installation of the VM and deployment process running "vagrant up" comand in PS
6. Wait till process end and check result in the host browser at address "192.188.56.160"

## Workspace description
Deployment view diagram.

![image](https://github.com/shamalets/SSDevOps-Demo1-StoreProject/blob/master/Vagrant/Demo-1%20UML.png)

As base image for deployment environment was taken vagrant box [gusztavvargadr/w16s](https://app.vagrantup.com/gusztavvargadr/boxes/w16s) with pre-installed SSH, WinRM and Chocolatey ver 0.10.11. User - vagrant, Password - vagrant.

Vagrant is configured to deploy VMs with the following services: MS SQL Server 2017 Express server, IIS server v10.0. 
The Git ver 2.20.1 is installed for delivery project's build and SQL script for DB from GitHub repository.
