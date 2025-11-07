package;

import flixel.FlxSprite;
import openfl.utils.Assets as OpenFlAssets;

using StringTools;

class HealthIcon extends FlxSprite
{
	public var sprTracker:FlxSprite;
	public var id:Int;
	private var isOldIcon:Bool = false;
	private var isPlayer:Bool = false;
	private var char:String = '';

	public var defualtIconScale:Float = 1;
	public var iconScale:Float = 1;
	public var iconSize:Float;

	var pixelIcons:Array<String> = ["bf-pixel", "senpai", "senpai-angry", "spirit"];

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
			loadGraphic('assets/images/fpsPlus/iconGrid.png', true, 150, 150);
			
			animation.add('bf', [0, 1, 30], 0, false, isPlayer);
			animation.add('bf-car', [0, 1, 30], 0, false, isPlayer);
			animation.add('bf-christmas', [0, 1, 30], 0, false, isPlayer);
			animation.add('bf-pixel', [21, 41, 40], 0, false, isPlayer);
			animation.add('spooky', [2, 3, 31], 0, false, isPlayer);
			animation.add('pico', [4, 5, 32], 0, false, isPlayer);
			animation.add('mom', [6, 7, 33], 0, false, isPlayer);
			animation.add('mom-car', [6, 7, 33], 0, false, isPlayer);
			animation.add('tankman', [8, 9, 50], 0, false, isPlayer);
			animation.add('face', [10, 11, 38], 0, false, isPlayer);
			animation.add('dad', [12, 13, 34], 0, false, isPlayer);
			animation.add('senpai', [22, 42, 43], 0, false, isPlayer);
			animation.add('senpai-angry', [44, 45, 46], 0, false, isPlayer);
			animation.add('spirit', [23, 47, 48], 0, false, isPlayer);
			animation.add('bf-old', [14, 15, 39], 0, false, isPlayer);
			animation.add('parents-christmas', [17, 18, 36], 0, false, isPlayer);
			animation.add('monster', [19, 20, 37], 0, false, isPlayer);
			animation.add('monster-christmas', [19, 20, 37], 0, false, isPlayer);
			animation.add('gf', [16, 49, (_id != -1) ? 49 : 35], 0, false, isPlayer);
			animation.add('gf-car', [16, 49, 35], 0, false, isPlayer);
			animation.add('gf-pixel', [16, 49, 35], 0, false, isPlayer);
			animation.add('monkey', [10, 11, 38], 0, false, isPlayer);
			animation.add('steve', [54, 55, 53], 0, false, isPlayer);
			animation.add('doll', [56, 57, 58], 0, false, isPlayer);
			animation.add('crash', [59, 60, 61], 0, false, isPlayer);
			animation.add('endo', [10, 11, 38], 0, false, isPlayer);
			animation.add('skeleton', [62, 63, 64], 0, false, isPlayer);
		
		iconSize = width;

		id = _id;

			antialiasing = ClientPrefs.globalAntialiasing;
			if(char.endsWith('-pixel')) {
				antialiasing = false;
			}
		
		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		setGraphicSize(Std.int(iconSize * iconScale));
		updateHitbox();

		if (sprTracker != null){
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
			if(Config.betterIcons){
				if(id == FreeplayState.curSelected){
					animation.curAnim.curFrame = 2;
				}
				else{
					animation.curAnim.curFrame = 0;
				}
			}
		}
	}

	public function swapOldIcon() {
		if(isOldIcon = !isOldIcon) changeIcon('bf-old');
		else changeIcon('bf');
	}

	public function changeIcon(char:String) {
			loadGraphic('assets/images/fpsPlus/iconGrid.png', true, 150, 150);
			
			animation.add('bf', [0, 1, 30], 0, false, isPlayer);
			animation.add('bf-car', [0, 1, 30], 0, false, isPlayer);
			animation.add('bf-christmas', [0, 1, 30], 0, false, isPlayer);
			animation.add('bf-pixel', [21, 41, 40], 0, false, isPlayer);
			animation.add('spooky', [2, 3, 31], 0, false, isPlayer);
			animation.add('pico', [4, 5, 32], 0, false, isPlayer);
			animation.add('mom', [6, 7, 33], 0, false, isPlayer);
			animation.add('mom-car', [6, 7, 33], 0, false, isPlayer);
			animation.add('tankman', [8, 9, 50], 0, false, isPlayer);
			animation.add('face', [10, 11, 38], 0, false, isPlayer);
			animation.add('dad', [12, 13, 34], 0, false, isPlayer);
			animation.add('senpai', [22, 42, 43], 0, false, isPlayer);
			animation.add('senpai-angry', [44, 45, 46], 0, false, isPlayer);
			animation.add('spirit', [23, 47, 48], 0, false, isPlayer);
			animation.add('bf-old', [14, 15, 39], 0, false, isPlayer);
			animation.add('parents-christmas', [17, 18, 36], 0, false, isPlayer);
			animation.add('monster', [19, 20, 37], 0, false, isPlayer);
			animation.add('monster-christmas', [19, 20, 37], 0, false, isPlayer);
			animation.add('gf', [16, 49, (_id != -1) ? 49 : 35], 0, false, isPlayer);
			animation.add('gf-car', [16, 49, 35], 0, false, isPlayer);
			animation.add('gf-pixel', [16, 49, 35], 0, false, isPlayer);
			animation.add('monkey', [10, 11, 38], 0, false, isPlayer);
			animation.add('steve', [54, 55, 53], 0, false, isPlayer);
			animation.add('doll', [56, 57, 58], 0, false, isPlayer);
			animation.add('crash', [59, 60, 61], 0, false, isPlayer);
			animation.add('endo', [10, 11, 38], 0, false, isPlayer);
			animation.add('skeleton', [62, 63, 64], 0, false, isPlayer);
		
		iconSize = width;

		id = _id;
		
			animation.add(char, [0, 1], 0, false, isPlayer);
			animation.play(char);
			this.char = char;

			antialiasing = ClientPrefs.globalAntialiasing;
			if(char.endsWith('-pixel')) {
				antialiasing = false;
			}
	}

	public function getCharacter():String {
		return char;
	}
}
