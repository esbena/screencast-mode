screencast-mode
===============

An Emacs mode for programming screencasts of Emacs usage.

The [screenast-mode.el](screenast-mode.el) is self-documenting just load it in Emacs, and type

```
M-x screencast-screencast-producer
```
or
```
M-x screencast-screencast-user
```

* The screencasts can be use by the lazy guys and gals who do not want
  to read the info-page for an Emacs mode.

* compared to the info-page of a mode: screencast-mode **displays**
  the capabilities of a mode, instead of just **describing** them

* the screencast can be modified easily to work with the most recent
  version of a mode

* the screencasts will fail if Emacs is missing the described mode

* example screencasts are available in [/screencasts](screencasts)

* example screencasts have been uploaded to YouTube as well, ex.: [graphviz-dot-mode at YouTube](https://www.youtube.com/watch?v=WEEuaN62hNI)

--------------------------------

screencast-record
=================

[screencast-record.el](screencast-record.el) can record a video of the screencasts. 

You can try it out by loading the file and evaluating the following:

```
 (screencast-record
  '("This is the test of the screencast-record" n
    "You can check the result in ~/screencast-record-test.ogv")
  "screencast-record-test")
```

You might want to look at the following two variables, as screen settings might vary

```
screencast-record-fill-column 

screencast-record-font
```

screencast-record.el depends on the following external programs:

* [recordmydesktop](http://recordmydesktop.sourceforge.net/about.php): for recording the emacs window 

* [wmctrl](http://tripie.sweb.cz/utils/wmctrl/): for fetching the name of the emacs window, and handing it to recordmydesktop
