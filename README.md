Usage: compile this file. It'll generate an executable, that you can use like
this:

    RGBToUIColor #ff0000

This'll print the following string:

    return [UIColor colorWithRed:255/255.0f green:158/255.0f blue:0/255.0f alpha:255/255.0f]; // #FF9E00

It's very handy to use it in the following way:

    RGBToUIColor `pbpaste` | pbcopy 

This'll paste in the hex string in your clipboard, and copy the `UIColor` call
to your clipboard.
