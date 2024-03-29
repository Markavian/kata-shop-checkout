package bbc.coding.kata;

import bbc.coding.kata.core.Assert;
import bbc.coding.kata.core.BaseTest;
import bbc.coding.kata.core.ExpectAssertion;

class BaseTestTests extends BaseTest
{
	public function test_expectReturnsExpectAssert():Void
	{
		var actual = expect(20);
		
		Assert.assertNotNull(actual);
		Assert.assertTrue(Std.is(actual, ExpectAssertion));
	}
	
	public function test_expectNotReturnsExpectAssert():Void
	{
		var actual = expect(20).not;
		
		Assert.assertNotNull(actual);
		Assert.assertTrue(Std.is(actual, ExpectAssertion));
	}
	
	public function test_expectToReturnsExpectAssert():Void
	{
		var actual = expect(20).to;
		
		Assert.assertNotNull(actual);
		Assert.assertTrue(Std.is(actual, ExpectAssertion));
	}
	
	public function test_expectToBe_shouldWork():Void
	{
		expectNoExceptions(function() {
			expect(20).to.be(20);
		});
	}
	
	public function test_expectToBe_shouldThrowAnException():Void
	{
		var actual = 10;
		var expected = 20;
		
		expectException(function() {
			expect(actual).to.be(expected);
		}, "Actual value " + actual + " should equal expected value " + expected);
	}
	
	public function test_expectToNotBe_shouldWork():Void
	{
		expectNoExceptions(function() {
			expect(10).to.not.be(20);
		});
		
		expectNoExceptions(function() {
			expect(10).not.be(20);
		});
		
		expectNoExceptions(function() {
			expect(10).not.to.be(20);
		});
	}
	
	public function test_expectToNotBe_shouldThrowAnException():Void
	{
		var expected = 10;
		var actual = expected;
		
		expectException(function() {
			expect(expected).to.not.be(actual);
		}, "Actual value " + actual + " should not equal expected value " + expected);
		
		expectException(function() {
			expect(expected).not.be(actual);
		}, "Actual value " + actual + " should not equal expected value " + expected);
		
		expectException(function() {
			expect(expected).not.to.be(actual);
		}, "Actual value " + actual + " should not equal expected value " + expected);
	}
	
	public function test_expectToBeNull_shouldWork():Void
	{
		var actual = null;
		
		expectNoExceptions(function() {
			expect(actual).to.beNull();
		});
	}
	
	public function test_expectToBeNull_shouldThrowAnException():Void
	{
		var actual = "not null";
		
		expectException(function() {
			expect(actual).to.beNull();
		}, "Actual value " + actual + " should be null");
	}
	
	
}