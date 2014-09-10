package bbc.coding.kata;

import bbc.coding.kata.item.Apple;
import bbc.coding.kata.item.Banana;
import bbc.coding.kata.item.Orange;

class Checkout
{
	var priceMap:PriceMap;
	var total:Price;
	
	public function new() 
	{
		priceMap = new PriceMap();
		priceMap.add(Apple, Price.make(30));
		priceMap.add(Banana, Price.make(40));
		priceMap.add(Orange, Price.make(50));
		
		total = Price.make(0);
	}
	
	public function scan(item:Dynamic):Void
	{
		var valueOfItem = priceMap.get(item);
		total = total.plus(valueOfItem);
	}
	
	public function totalBalance():Price
	{
		return total;
	}
}