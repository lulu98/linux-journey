#!/usr/bin/env python
# Python Script is based on the following script: https://gist.github.com/ralphbean/5733076

import pygithub3
import subprocess
import os
import sys
import git

gh = None

def gather_repos(organization, no_forks=True):
    repos = gh.repos.list(user=organization).all()
    for repo in repos:
        if no_forks and repo.fork:
            continue
        yield repo.clone_url

if __name__ == '__main__':
    if len(sys.argv)!=2:
        print("Enter user name of a GitHub account!")
        exit(1)
    gh = pygithub3.Github()
    user_name = sys.argv[1]
    print("Cloning/Pulling Github repositories of user {}.".format(user_name))
    clone_dir = os.path.join(os.getenv("HOME"),"Documents/Projects/GitHub")
    clone_urls = gather_repos(user_name)
    
    # updating available local repositories
    for root, dirs, files in os.walk(clone_dir):
        for d in dirs:
            pull_dir = os.path.join(clone_dir,d)
            print("pulling {}".format(pull_dir))
            git.Git(pull_dir).pull('origin','master')
        break
    
    # cloning non-existing remote repositories
    for url in clone_urls:
        bashCommand = "find {} -type f | xargs grep '{}' | wc -l".format(clone_dir,url)
        output = subprocess.check_output(['bash','-c', bashCommand])
        if int(output) == 0:
            print("cloning into {}".format(url))
            git.Git(clone_dir).clone(url)
