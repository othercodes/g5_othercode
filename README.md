# tpl_othercode

otherCode Joomla Template developed with Gantry 5

## Build Package

Run the following command:

```bash
sh ./tpl_othercode.sh
```

## Configuration

Access to template configuration in: **Extensions > Template > Styles > [Template Name]**

### Parallax Effect in section background

Configuring parallax in Home page for section showcase:

1. Import `jquery.stellar.js` in **Base Outline > Page Settings [Tab] > Assets**.
2. In **Home > Styles [tab]** set **Showcase Styles > Parallax Effect** to `enabled`.
3. In **Home > Layout** edit the showcase section and add a new tag attribute for: `data-stellar-background-ratio` = `0.5`
