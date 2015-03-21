# dani-serv-cookbook

A cookbook with only tests meant to help teach my girlfriend chef

## Supported Platforms

Ubuntu 14.04

## Attributes

| Key                       | Type   | Description                  | Default            |
|---------------------------|--------|------------------------------|--------------------|
| ['dani-serv']['password'] | String | Password for Dani User       | 'foo'              |
| ['dani-serv']['webroot']  | String | Webroot for hello_world site | '/srv/hello_world' |

## Usage

### dani-serv::default

Include `dani-serv` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[dani-serv::default]"
  ]
}
```

## License and Authors

Author:: James Awesome (james@wesome.nyc)
