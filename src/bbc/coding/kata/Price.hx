package bbc.coding.kata;
import haxe.ds.IntMap.IntMap;

/**
 * ...
 * @author BBC TV & Mobile Platforms
 */
class Price
{
	private static var map = new IntMap<Price>();
	
	var value:Int;

	public function new(value:Int) 
	{
		this.value = value;
		
		if (Price.map.exists(value))
		{
			throw "Cannot redefine a price of value " + value;
		}
		
		Price.map.set(value, this);
	}
	
	public function plus(price:Price):Price
	{
		if (price == null)
		{
			return this;
		}
		return Price.make(this.value + price.value);
	}
	
	public function toString():String
	{
		return "Price(" + value + ")";
	}
	
	public static function make(value:Int):Price
	{
		if (map.exists(value))
		{
			return map.get(value);
		}
		
		return new Price(value);
	}
}