package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
  /**
   * Function that is called up when to state is created to set it up. 
   */
  override public function create():Void
  {
    // Set a background color
    FlxG.cameras.bgColor = 0xff131c1b;
    // Show the mouse (in case it hasn't been disabled)
    #if !FLX_NO_MOUSE
    FlxG.mouse.show();
    #end

    //FlxG.log.redirectTraces = false;
    super.create();

    var s = new FlxSprite(10, 10);
    s.makeGraphic(50, 50, 0xffff0000);

    add(s);

    FlxG.watch.add(FlxG.mouse, "x");
    FlxG.watch.add(FlxG.mouse, "y");

    FlxTween.linearMotion(s,
        10, 10, 100, 100,
        0.2, true,
        {ease : FlxEase.quadIn,
          type : FlxTween.ONESHOT,
          complete : function(t)
            {
              s = new FlxSprite(100, 100);
              s.makeGraphic(50, 50, 0xff00ff00);
              add(s);
            }
        });

    var startTime:Int = flash.Lib.getTimer();
    var txt = new FlxText(10,400,400,"This should change in 2 Seconds",8);
    txt.color = 0xFFFFFF00;
    add(txt);
    FlxTween.linearMotion(txt,
      10, 400, 10, 400, 2, true, {complete : function(t)
                                    {
                                      if( flash.Lib.getTimer() - startTime < 2000)
                                      {
                                        txt.text = "Tween lasted less than 2 seconds, failure!";
                                        txt.color = 0xFFFF0000;
                                      }
                                      else
                                      {
                                        txt.text = "It has been at least 2 seconds, success!";
                                        txt.color = 0xFF00FF00;
                                      }
                                    }
                                  } );

    var x = new FlxSprite(300, 100);
    var y = new FlxSprite(300, 100);
    x.makeGraphic(50, 50, 0xffff0000);
    y.makeGraphic(40, 40, 0xff00ff00);

    add(x);
    add(y);

    FlxTween.circularMotion(x, 200, 100, 100, 0, true,
        4, true,
        {ease : FlxEase.quadIn,
          type : FlxTween.ONESHOT,
          complete : function(t)
            {
            }
        });

    var a = new FlxSprite(50, 200);
    var b = new FlxSprite(50, 200);
    a.makeGraphic(40, 40, 0xffff0000);
    b.makeGraphic(30, 30, 0xff00ff00);
    add(a);
    add(b);

    FlxTween.cubicMotion(a, 50, 200, 500, 100, 400, 200, 50, 200,
        4,
        {ease : FlxEase.quadIn,
          type : FlxTween.ONESHOT,
          complete : function(t)
            {
            }
        });

    var q = new FlxSprite(300, 200);
    var w = new FlxSprite(300, 200);
    q.makeGraphic(40, 40, 0xffff0000);
    w.makeGraphic(30, 30, 0xff00ff00);
    add(q);
    add(w);

    FlxTween.quadMotion(q, 300, 200, 300, 500, 300, 200,
        4, true,
        {ease : FlxEase.quadIn,
          type : FlxTween.ONESHOT,
          complete : function(t)
            {
            }
        });
  }
  
  /**
   * Function that is called when this state is destroyed - you might want to 
   * consider setting all objects this state uses to null to help garbage collection.
   */
  override public function destroy():Void
  {
    super.destroy();
  }

  /**
   * Function that is called once every frame.
   */
  override public function update():Void
  {
    super.update();
  } 
}
