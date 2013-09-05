name                "sass"
description         "Installs and converts .scss to .css"
long_description    IO.read(File.join(File.dirname(__FILE__), 'README.markdown'))
version             "1.0.0"
license             "MIT"
depends             "ruby"
provides            "sass"
recipe              "sass", "Installs and converts .scss to css"
supports            "ubuntu"
maintainer          "Jeremy Seago"
maintainer_email    "seagoj@gmail.com"