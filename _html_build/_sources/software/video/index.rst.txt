Video
**********

Quickly convert to ``.gif`` files:
=========================================
Following `this link <https://superuser.com/questions/556029/how-do-i-convert-a-video-to-gif-using-ffmpeg-with-reasonable-quality>`_

Add this to your ``~/bash_profile`` file:
::

  # Convert video to gif file.
  # Usage: video2gif video_file (scale) (fps)
  video2gif() {
    ffmpeg -y -i "${1}" -vf fps=${3:-30},scale=${2:-320}:-1:flags=lanczos,palettegen "${1}.png"
    ffmpeg -i "${1}" -i "${1}.png" -filter_complex "fps=${3:-10},scale=${2:-320}:-1:flags=lanczos[x];[x][1:v]paletteuse" "${1}".gif
    rm "${1}.png"
  }

Then load it in the ``.bashrc`` file:
::

  . ~/.bash_profile
