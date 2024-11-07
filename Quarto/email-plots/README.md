# Quarto Emails with Plots (with Connect)

## Send an email including plots

Make the magic happen: <https://docs.posit.co/connect/user/quarto/#email-customization> 

> Email customization requires Quarto 1.4.

Also useful: 

- <https://docs.posit.co/connect/user/quarto/index.html#email-customization> 
- <https://quarto.org/docs/authoring/conditional.html> 
- <https://github.com/rich-iannone/quarto-email/issues/9> 

Modify the yaml to change the output format (note that a specific quarto version or most recent is required): 

```
format: email
```

Add a section to define the email content. Files can be attached, calculation outputs can be included, and this can even be wrapped in a conditional statement to only send on certain conditions. 

## Implementation notes

References: 

- <https://docs.posit.co/connect/user/quarto/index.html#email-customization> 
- <https://quarto.org/docs/authoring/conditional.html> 
- <https://github.com/rich-iannone/quarto-email/issues/9> 

### RSS feed details

Goal: Using the RSS feed from [the published sample blog](https://colorado.posit.co/rsc/connect/#/apps/1561d39e-977a-4e5c-9e73-857860b3d076/access) this quarto document will send an email when a new blog has been published. 

The [quarto RSS feed option](https://quarto.org/docs/websites/website-blog.html#rss-feed) will need to be enabled on the site that will be tracked. We can then use [tidyrss](https://robertmyles.github.io/tidyRSS/) to read the rss file back. 

This is using an example that was [deployed to Posit Connect](https://quarto.org/docs/publishing/rstudio-connect.html#publish-command) for the email generation with the [Connect Email Generation feature](https://quarto.org/docs/prerelease/1.4/email.html). 

Limitations: 

- This implementation currently doesn't have handling for authentication and only works with quarto blogs that have been published **anyone, no login required**. 
- What happens if the scheduling service is interrupted for some reason? Right now the lookback is still just for the last 1 day. Other options could be to `pin` the xml and use that to compare to what was available the last time it ran, or use `connectapi` to check when last it successfully ran and use that to generate a timeframe. 
- Email customization requires Quarto 1.4.

Reference: 

- <https://r-charts.com/evolution/time-series-ggplot2/> 
- <https://stackoverflow.com/questions/61546244/reverse-engineering-cumulative-to-daily-data> 
- Color selection: <https://r-graph-gallery.com/ggplot2-color.html> 
- Color blind selection: <https://stackoverflow.com/questions/57153428/r-plot-color-combinations-that-are-colorblind-accessible> and <http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/> 
- TODO: peaks and valleys <https://r-charts.com/evolution/time-series-ggplot2/> 

Here's a couple palettes I'd like to use more: 

- paletteer_d("ggsci::planetexpress_futurama")
- paletteer_d("vapoRwave::vapoRwave")

