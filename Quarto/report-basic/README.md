# Basic Report : Debugging R Environments

# Bells and Whistles 

## Formatting tips and tricks 

### Theme-ing

We can set some theme options around the table of contents (toc), scrolling, link options, and overall theme. In this case the theme `journal` is selected because it's pretty. 

```
format:
  html:
    theme: journal
    toc: true
    toc-location: right
    anchor-sections: true
    smooth-scroll: true
    link-external-icon: true
    link-external-newwindow: true
```

### Linking back to version control

We can add a link back to our code from our document with: 

```
    code-links:
      - text: Source Code
        icon: github
        href: https://github.com/leesahanders/quarto-for-reproducible-reporting-demo/tree/main/content-examples/report-basic
```

### Adding images 

We can add images with this syntax: 

```
![alt text](https://solutions.posit.co/envs-pkgs/environments/reproduce/reproducibility-strategies-and-danger-zones.png)
```

The image can either be a URL to somewhere external, or can be to an image saved somewhere in the project. 




