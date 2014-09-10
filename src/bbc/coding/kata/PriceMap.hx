package bbc.coding.kata;

import haxe.ds.StringMap.StringMap;

class PriceMap
{
	public var map:StringMap<Price>;

	public function new() 
	{
		map = new StringMap<Price>();
	}
	
	public function add(itemType:Class<Dynamic>, price:Price):Void
	{
		var priceKey:String = createPriceKey(itemType);
		map.set(priceKey, price);
	}
	
	public function get(item:Dynamic):Price
	{
		var priceKey:String = createPriceKey(item);
		
		if (map.exists(priceKey))
		{
			return map.get(priceKey);
		}
		
		return Price.make(0);
	}
	
	function createPriceKey(thing:Dynamic):String
	{
		var type:Class<Dynamic> = Std.is(thing, Class) ? thing : Type.getClass(thing);
		var key:String = Std.string(type);
		return key;
	}
}