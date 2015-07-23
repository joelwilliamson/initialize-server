#!/bin/sh

groupadd user
groupadd wheel
useradd -g user -G wheel -m joel 
