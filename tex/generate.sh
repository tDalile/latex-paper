#!/bin/bash

author="YOURNAME"
prefix_version=$(date +"%Y%m%d%H%M")
prefix_final=$(date +"%Y%m%d")
folder_versions="../versions"
folder_root=".."

while getopts "vf" option; do
  case "${option}" in
    v)  echo "Creating new version: $prefix_version..."
        mv paper.pdf $folder_versions/$prefix_version-$author.pdf
        ;;
    f)  newest=$(ls $folder_versions -1 | sort -n --reverse | head -n 1)
        echo "Creating final version $prefix_final..."
        cp $folder_versions/$newest $folder_root/$prefix_final-$author.pdf
        ;;
  esac
done

rm -f *.pyg *.lot *.lof *.lol *.toc *.log *.out *.aux *.blg *.bbl config/*aux paper.bib *.brf