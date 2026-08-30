---
layout: post.njk
title: "build: file-tinder"
date: 2026-08-30
---

Tinder style UI for clearing out files from `Downloads/` folder

Right is keep, Left is delete, R is Rename, U for undo. O to open the file.

<video poster="/images/file-tinder-poster.jpg"
       autoplay loop muted playsinline preload="metadata"
       style="width:100%;height:auto;display:block;margin:1.5rem 0;border-radius:10px;">
  <source src="/images/file-tinder.webm" type="video/webm">
  <source src="/images/file-tinder.mp4" type="video/mp4">
</video>

Use Cases -
- Clear out Downloads folder(or specify the folder: `bun run index.ts dir-name` )
- If you have Google Drive/Dropbox/OneDrive mounted, you could triage that too

I pair this with [organize](https://organize.readthedocs.io/en/latest/) to move files I decided to keep organized into folders.


```
# Sample ~/.config/organize/config.yaml
rules:
  # ---------------------------------------------------------------
  # 1. SECRETS - quarantine, never delete
  # ---------------------------------------------------------------
  - name: "Secrets - quarantine for manual review"
    locations: ~/Downloads
    subfolders: false
    filter_mode: any
    filters:
      - extension: [pem, gpg, key, p12, pfx, keychain, asc]
      - name:
          contains:
            - client_secret
            - recovery-codes
            - private-key
            - service-account
          case_sensitive: false
    actions:
      - move: "~/Downloads/_SECRETS_REVIEW/"
```

Try it yourself: [https://github.com/niraj8/things/tree/main/file-tinder](https://github.com/niraj8/things/tree/main/file-tinder)
