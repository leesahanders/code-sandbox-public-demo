# Quarto Programmatically Customized Emails (with Connect)

## Send an email with programmatically generated content

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

