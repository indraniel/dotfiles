{:user {:plugins [[cider/cider-nrepl "0.22.4"]
                  [venantius/ultra "0.6.0"]
                  [lein-try "0.4.3"]]
        :dependencies [[cljfmt "0.6.4"]
                       [com.bhauman/rebel-readline "0.1.4"]]
        :aliases  {"rebl" ["trampoline" "run" "-m" "rebel-readline.main"]}}
