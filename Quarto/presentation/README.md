# Presentation 

Theme-ing can be done a couple ways: 

- Adding themeing through the top yaml using one of the supported modes (also supports custom themeing)
- Adding extensions to the main folder of the project 

# Themes

```
---
title: "Presentation"
format:
  revealjs: 
    theme: dark
---
```

Acceptable themes include: beige, dark, default, league, moon, simple, sky, solarized

For a custom theme, a custom sass file would be created and referenced: 

```
theme: [default,custom.scss]
```

custom.scss:

```
/*-- scss:defaults --*/

$body-bg: #191919;
$body-color: #fff;
$link-color: #42affa;

/*-- scss:rules --*/

.reveal .slide blockquote {
  border-left: 3px solid $text-muted;
  padding-left: 0.5em;
}
```

Read more about reveal themes [here](https://quarto.org/docs/presentations/revealjs/themes.html)

# Extensions 

Extensions are a good way to share theme's across an organization. 

The extension needs to be installed: 

```bash
quarto use template gesiscss/quarto-revealjs-fakegesis
```

It is then referenced from the yaml: 

```
format: fakegesis-revealjs
```

Other general extensions can also be added following the same method, in that case the yaml might look something like this: 

```
title: "My presentation"
format:
  revealjs: default
revealjs-plugins:
  - confetti
```

There are a bunch of publicly available theme extensions [here](https://quarto.org/docs/extensions/listing-revealjs.html) 

