## passwd
### Ubuntu
```bash
# cd /etc/sudoers.d
# sudo vim vbird

# BEGIN OF EXAMPLE
vbird ALL=(root) NOPASSWD:ALL
Defaults:vbird secure_path=/sbin:/usr/sbin:/usr/bin:/bin:/usr/local/sbin:/usr/local/bin
# END OF EXAMPLE
```
```vim
:%s/vbird/xxx/gc
```

### CentOS & MAC
```bash
# sudo vim /etc/sudoers

# begin of sample

## The COMMANDS section may have other options added to it.
##
## Allow root to run any commands anywhere
root     ALL=(ALL)       ALL
vbird ALL=(ALL)     NOPASSWD: ALL

## Allows members of the 'sys' group to run networking, software,

# end of sample
```

### SCRIPT Refer (run with root privilege)
> For Ubuntu

run it

```bash
user=vbird
cd /etc/sudoers.d
cat > $user << _EOF
$user ALL=(root) NOPASSWD:ALL
Defaults:$user secure_path=/sbin:/usr/sbin:/usr/bin:/bin:/usr/local/sbin:/usr/local/bin
_EOF
```