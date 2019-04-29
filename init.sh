#!/usr/bin env bash 

systemctl stop firewalld  && systemctl disable firewalld
setnforce 0
sed -i s/SELINUX=enforcing/SELINUX=disabled/g /etc/selinux/config
curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
curl -o /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo

if [ -f /usr/bin/ntpdate ];then
  ntpdate -b ntp1.aliyun.com
else
  yum -y install ntpdate
  ntpdate -b ntp1.aliyun.com
