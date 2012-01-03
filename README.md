##KSSS - KSS Standalone Documentation Creation
###A command-line utility
_________________________________________

ksss.rb takes your given CSS directory and spits out a coherent HTML document. This is, of course, using the awesome [KSS](https://github.com/kneath/kss "KSS on Github") parser/spec.

Using KSSS is simple, just run the file and give it your CSS directory. Optionally, you can give it the section numbers you want to include in your documentation creation. If you choose to go without sections, make sure in you use the same section number for all areas of your documentation.

    > ksss.rb relative/path/to/css 1.1 1.2 2.1
