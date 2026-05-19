# jlayao-3d

Self-hosted 3D Gaussian splat viewer for [jlayao.com](https://jlayao.com), replacing a paid Spline embed.

## Files

| File | Purpose |
|------|---------|
| `index.html` | Viewer (CDN-hosted Three.js + gaussian-splats-3d) |
| `model.splat` | Clean scan export from SuperSplat |

## Local preview

```bash
python3 -m http.server 8000
```

Open [http://localhost:8000](http://localhost:8000)

Add `?debug=1` to tune model rotation and log values to paste into `CONFIG.modelRotationDeg`.

## GitHub setup (one time)

This folder is a git repo. To create the GitHub repo and push:

```bash
chmod +x setup-github.sh
./setup-github.sh
```

Or manually: [create `jlayao-3d` on GitHub](https://github.com/new), then:

```bash
git remote add origin https://github.com/jordanlayao/jlayao-3d.git
git push -u origin main
```

## Sync changes to GitHub

After editing `index.html` or `model.splat`:

```bash
git add -A
git commit -m "Describe your change"
git push
```

Or use **Source Control** in Cursor (branch icon) → stage → commit → push.

## GitHub Pages

1. Repo → **Settings → Pages** → Source: **Deploy from branch** → `main` → `/ (root)`.
2. Live URL: **https://jordanlayao.github.io/jlayao-3d/**

## Framer embed

Replace the Spline embed with an iframe:

```html
<iframe
  src="https://jordanlayao.github.io/jlayao-3d/"
  width="100%"
  height="100%"
  frameborder="0"
  style="border:0; background:#fff;"
  allow="fullscreen"
  loading="lazy"
></iframe>
```

Match the frame size to your previous Spline block. Background is white (`#ffffff`) to align with the site.

## Config

Edit the `CONFIG` object at the top of `index.html`:

- `modelRotationDeg` — upright orientation (default `180°` on X)
- `orbitSpeed`, `orbitRadius`, `cameraHeight` — auto-rotation feel
- `autoRotate: false` — disable spin (e.g. for debugging)
