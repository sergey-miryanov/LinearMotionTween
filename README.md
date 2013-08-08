LinearMotionTween
=================

Show problem for LinearMotionTween

Problem is
==========

- we tween object with linear motion during x seconds
- when x seconds elapsed FlxTween decide that tween should be finished and finish it
- if LinearMotion tween finished it removed from TweenManager
- if tween removed from manager it (tween) destroyed
- if LinearMotion tween is destroyed his _object set to null
- Motion tween update calls postUpdate after FlxTween.update
- postUpdate check _object and if it is not null set object to new position
- and problem is this - after finish _object is null and object to set to last position

Result
======

If LinearMotionTween works fine green square should overlap whole red square
