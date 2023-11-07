# Chromium with NoVNC

```
docker run --rm --name remote-chromium -e VNC_PASS=samplepass -p 9870:9870  furacas/remote-chromium:latest
```

<p><b><h3>[ ! ] This project runs directly as a root user with non-sandboxed chromium! <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;do not use in production environments.</h3></b></p>

## Environment variables: 
|      Name      |                description           |
|:--------------:|:--------------------------------------------------------------:|
|    VNC_PASS    |               VNC Password (Default: samplepass)               |
|    VNC_TITLE   |              VNC Session Title (Default: Chromium)             |
| VNC_RESOLUTION |               VNC Resolution (Default: 1280x720)               |
|    APP_NAME    |                Name of the app (Heroku specific)               |
|    NO_SLEEP    | Prevent app from sleeping (Heroku specific, default: disabled) |

## Reference
- [vital987/chrome-novnc](https://github.com/vital987/chrome-novnc)
