# varo.team

The Varo website. Static HTML, CSS, and a small amount of JavaScript. No build
step, no dependencies, no framework.

## Run it locally

```bash
python3 -m http.server 8000
```

Then open `http://localhost:8000`. Serving over HTTP rather than opening the file
directly matters here, so the self-hosted fonts and relative paths resolve the way
they do in production.

## Files

| Path | What it is |
|---|---|
| `index.html` | The page |
| `styles.css` | Design tokens, then layout |
| `script.js` | Footer year and a placeholder guard |
| `fonts/` | Self-hosted variable fonts |
| `check.sh` | Pre-publish checks |

## Deploy

Served by GitHub Pages from the root of `main`. Pushing to `main` publishes.

`.nojekyll` keeps Pages from running the files through Jekyll.

## Checks

```bash
sh check.sh
```

Fails on leftover placeholder markers, em dashes, banned words, or any link back
to a font CDN. Run it before publishing.

## Editing

Colour and type are tokens in the `:root` block at the top of `styles.css`.
Nothing else in the repo carries a colour value, so changing the palette is an
edit to that one block.

## Fonts

Fraunces, DM Sans, and DM Mono, self-hosted as variable `.woff2` files. All three
are licensed under the SIL Open Font License 1.1; the license text for each ships
alongside the fonts in `fonts/`.
