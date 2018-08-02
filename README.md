# tpl_othercode

otherCode Joomla Template developed with Gantry 5

![template_preview.png](template_preview.png)

## Build Package

Run the following command:

```bash
sh ./tpl_othercode.sh
```

## Configuration

Access to template configuration in: **Extensions > Template > Styles > [Template Name]**

### Load JS main file

1. Enable the JavaScript Frameworks Atom > jQuery Framework in **Base Outline > Page Settings [Tab] > Atoms**
2. Import `othercode.js` in **Base Outline > Page Settings [Tab] > Assets** (Before `</body>` **on**, Load Priority `-1`).

### Animations

1. Import `jquery.inview.js` in **Base Outline > Page Settings [Tab] > Assets** (Before `</body>` **on**).
2. Import `wow.js` in **Base Outline > Page Settings [Tab] > Assets** (Before `</body>` **on**).

### Parallax Effect in section background

Configuring parallax in Home page for section showcase:

1. Import `jquery.enllax.js` in **Base Outline > Page Settings [Tab] > Assets** (Before `</body>` **on**).
2. In **Home > Styles [tab]** set **Showcase Styles > Parallax Effect** to `enabled`.
3. In **Home > Layout** edit the showcase section and add a new tag attribute for: `data-enllax-ratio` = `-0.2`

#### Disclaimer

All used images are from **pexels.com**.