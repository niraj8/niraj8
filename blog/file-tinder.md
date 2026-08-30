---
layout: post.njk
title: "build: file-tinder"
date: 2026-08-30
---

Tinder style UI for clearing out files from `Downloads/Desktop/<Any>` folder

Right is keep, Left is delete, R is Rename, U for undo. O to open the file.

<video poster="/images/file-tinder-poster.jpg"
       autoplay loop muted playsinline preload="metadata"
       style="width:100%;height:auto;display:block;margin:1.5rem 0;border-radius:10px;">
  <source src="/images/file-tinder.webm" type="video/webm">
  <source src="/images/file-tinder.mp4" type="video/mp4">
</video>

Use Cases -
- Clear out Downloads folder(or specify the folder: `file-tinder dir-name` )
- If you have Google Drive/Dropbox/OneDrive mounted, you could triage that too.

## Try it yourself: `brew install niraj8/tap/file-tinder`

I pair this with [organize](https://organize.readthedocs.io/en/latest/) to move files I decided to keep them organized into folders.

```yaml
# Sample Rules from ~/.config/organize/config.yaml
rules:
  # Handled duplicate files
  - name: "Duplicate files (checksum)"
    locations: ~/Downloads
    subfolders: false
    filters:
      - duplicate:
          detect_original_by: created
          hash_algorithm: sha256
    actions:
      - trash

  # Trash Older files
  - name: "Installers older than 60 days"
    locations: ~/Downloads
    subfolders: false
    filters:
      - extension: [dmg, pkg, ipa]
      - lastmodified:
          days: 60
          mode: older
    actions:
      - trash
```

Source: [https://github.com/niraj8/file-tinder](https://github.com/niraj8/file-tinder)
