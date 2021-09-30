# update-brew-tap

## Usage

```yaml
- name: upgrade-brew-tap
  uses: chyroc/upgrade-brew-tap@v0.24.0
  with:
    name: "<tap-name>"
    tap_repo: "<username>/homebrew-tap"
    token: ${{ secrets.TAP_TOKEN }}
```

## Dev

- actions: https://github.com/marketplace/actions/upgrade-brew-tap
