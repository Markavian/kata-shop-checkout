package bbc.coding.kata;

import bbc.coding.kata.core.Assert;
import bbc.coding.kata.core.BaseTest;
import bbc.coding.kata.item.Apple;
import bbc.coding.kata.item.Banana;
import bbc.coding.kata.item.Orange;

class CheckoutTests extends BaseTest
{	
	public function test_checkoutCanScanAnApple()
	{
		var checkout = new Checkout();
		var item = new Apple();
		
		checkout.scan(item);
		
		var expected = Price.make(30);
		var actual = checkout.totalBalance();
		
		Assert.assertEqual(expected, actual);
	}
	
	public function test_checkoutCanScanAppleAndABanana()
	{
		var checkout = new Checkout();
		
		checkout.scan(new Apple());
		checkout.scan(new Banana());
		
		var expected = Price.make(70);
		var actual = checkout.totalBalance();
		
		Assert.assertEqual(expected, actual);
	}
	
	public function test_checkoutCanScanAppleABananaAndAnOrange()
	{
		var checkout = new Checkout();
		
		checkout.scan(new Apple());
		checkout.scan(new Banana());
		checkout.scan(new Orange());
		
		var expected = Price.make(120);
		var actual = checkout.totalBalance();
		
		Assert.assertEqual(expected, actual);
	}
	
}