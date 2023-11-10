# Remote Chromium with NoVNC

```
docker run -d --rm --name remote-chromium -p 9870:9870  furacas/remote-chromium:latest
```

After running the Docker command, you can access the remote Chromium browser via your web browser at http://localhost:9870 . Adjust the settings using the provided environment variables if necessary.

## Environment variables: 
|      Name      |                description                                     |
|:--------------:|:--------------------------------------------------------------:|
|    VNC_PASS    |               VNC Password                                     |
| VNC_RESOLUTION |               VNC Resolution (Default: 1280x720)               |

## Credits
- [vital987/chrome-novnc](https://github.com/vital987/chrome-novnc)
