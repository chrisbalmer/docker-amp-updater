# Cisco AMP Updater Docker Image

This is a small docker image that will sync AMP updates to a volume that should be shared with an NGINX container. Then you can point your AMP clients to the NGINX container for updates.

## Variables

You'll need to set `BUSINESS_GUID` to your company's GUID for AMP. You can get this by downloading the config file from [AMP here](https://console.amp.cisco.com/tetra_update).