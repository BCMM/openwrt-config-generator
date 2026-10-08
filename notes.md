OpenWrt docker images use a variety of different tag patterns. In most cases, there are several different tags for the same release.

The most comprehensively used tag pattern is

    ^x86-64-\d\d\.\d\d\.\d{1,2}$

for example,
    
    x86-64-18.06.9

Alternatives include tags with an underscore in `x86-64` and tags with a `v` just before the version number.

Three versions are currently not available in the pattern above, but *are* available in the `v` variant: 21.02.4, 21.02.6, 22.03.1. I think it's best to just deal with those semi-manually during the initial runs, and hope that the current pattern will continue in future.

In order to make that sort of manual usage easier, communication between check and generate should be in Docker tags, and the generate job should accept any Docker tag (possibly with a notice in the log for irregular tags). The actual OpenWrt version used for Git tagging must be derived from the container contents only.
