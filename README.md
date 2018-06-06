# dji-rtmp

This is a simple container that lets you stream a dji drone to an rtmp endpoint.
Run this container inside of an EC2 instance in AWS.

If you tell the drone to stream to this address, where the hostname is something you actually own, like an EC2 instance,
`rtmp://mydjidrone.rfielding.com:1935/live/a`, 
then port 1935 is expected to be this nginx server (it is NOT http or https on this rtmp port!).
The drone will stream to it if your mobile device DJI app is running, and you select a custom live stream with that URL.

The next step to simply test it:

- On OSX, I had to use an old version of VLC to see rtmp streams correctly.  I installed VLC 2.2.4, and was able to read from the rtmp url.
- Once VLC works, you can use ffmpeg command-lines to convert these streams into mp4 files.

For example, to extract the currently streaming 1MB off of a stream, you can run this:

```
ffmpeg -i rtmp://mydjidrone.rfielding.com:1935/live/a -fs 1000000 flight.mp4
```
