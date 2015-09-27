#!/bin/bash

if [ "$TRAVIS_REPO_SLUG" == "kteza1/switch-case" ] && [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_BRANCH" == "master" ]; then

  echo -e $TRAVIS_BUILD_DIR
  echo -e "Publishing docs to github pages...\n"

  cp -R documentation/site/* $HOME/doc-latest

  cd $HOME
  git config --global k.teza1@gmail.com "travis@travis-ci.org"
  git config --global kteza1 "travis-ci"
  git clone --quiet --branch=gh-pages https://${GH_TOKEN}@github.com/kteza1/switch-case gh-pages > /dev/null

  cd gh-pages
  git rm -rf *
  cp -Rf $HOME/doc-latest/* .
  git add -f .
  git commit -m "Lastest doc on successful travis build $TRAVIS_BUILD_NUMBER auto-pushed to gh-pages"
  git push -fq origin gh-pages > /dev/null

  echo -e "Published docs to gh-pages.\n"
  
fi