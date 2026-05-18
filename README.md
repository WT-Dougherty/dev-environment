# Development Environment

## Overview

This codebase can be used to create & deploy an isolated development environment to either your local machine or to the cloud. I came across this concept recently and I thought it was super cool, so I decided to try and recreate it. What's nice about something like this is that you can essentially create as large of a machine as you want when you host this container in the cloud. You could add more ram than would be possible to buy with scaling EC2 instances & run some crazy batch jobs.

## Prerequisites

This repo uses shell scripts and is made for MacOS/Linux. You also need to have Docker & Make installed.

## Repo Instructions

### Running Locally

1. Run `make setup` to create local ssh keys for the container to use.
2. Run `make default-build-local` to run the container with default arguments locally, & `make build-local RAM={ram_size}g CPUS={num_cpu_cores}` to customize the available working memory & the number of CPU cores.
3. Run `make connect-local` to ssh into your now running container.
