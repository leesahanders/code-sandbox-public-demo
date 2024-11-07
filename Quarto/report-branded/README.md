# Branded Report : Installation Checklist

# Bells and Whistles 

## Light and Dark mode 

We can have a light and dark mode (that visitors can toggle between) by adding: 

```
    theme:
      light: [cosmo, theme-light.scss]
      dark: [darkly, theme-dark.scss]
```

## Links 

We can add a whole section with different links and callouts to help direct users: 

```
    other-links:
      - text: Need help?
        href: https://docs.posit.co/support/
    code-links:
      - text: Source Code
        icon: github
        href: https://github.com/leesahanders/quarto-for-reproducible-reporting-demo/tree/main/content-examples/report-branded
```

## Custom theme-ing 

In addition to using the different [Quarto bootstrap themes](https://quarto.org/docs/output-formats/html-themes.html), we can also write our own custom scss to tweak how the finished rendered document looks. 

By having `[darkly, theme-dark.scss]` we are telling the rendering engine that we want to use the `darkly` theme with additionl customizing from the `theme-dark.scss` file. We could also completely develop our own theme and reference only it. 

For example our custom scss might include customizations like: 

```
/* Posit logo - navbar or footer */
#footer-right-posit-logo {
  width: 70px;
  min-width: 70px;
}

/* Mini TOC */
.sidebar nav[role=doc-toc]>ul li a {
    text-transform: none !important;
    font-family: $font-family-sans-serif;
    font-size: 16px;
    font-weight: 300 !important;
    letter-spacing: .05em !important;
}
```



