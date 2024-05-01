# A very ILteresting Celeste Mod
Yeah, a mod in pure IL, just as a proof of concept.

## What does it do?
It has a simple module and two entities:
- One that allows infinite dashing in it, simple.
- Another one that cancels your jump but accumulates your speed, so the next time you jump outside of it you will get 
all your accumulated speed.

It also features an MonoMod ILHook in IL. :peaceline:

## Building
Requires `ilasm` from mono under linux.

Just run the `buildil` script and you are good to go.

If you are on windows, somehow adapt the script to whatever cli interface windows uses.

## Disclaimer
Yeah, theres lua code in here, but that's for the loenn plugin, just ignore it.
